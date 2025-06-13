import SwiftUI
import AuthenticationServices
import CryptoKit

func generateCodeVerifier() -> String {
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~"
    return String((0..<128).map { _ in characters.randomElement()! })
}

func generateCodeChallenge(from verifier: String) -> String {
    let data = Data(verifier.utf8)
    let hash = SHA256.hash(data: data)
    return Data(hash).base64EncodedString()
        .replacingOccurrences(of: "=", with: "")
        .replacingOccurrences(of: "+", with: "-")
        .replacingOccurrences(of: "/", with: "_")
}

class SpotifyAuthViewModel: ObservableObject {
    let clientID = "045c3d308d65407a9cf8cebeaca1fd3a"
    let redirectURI = "hellospotify2://callback"
    
    @Published var accessToken: String?
    @Published var refreshToken: String?
    @Published var isAuthenticated = false
    @Published var userName: String?
    @Published var userProfileImage: String?
    @Published var currentTrack: String?
    @Published var currentArtist: String?
    @Published var albumCoverURL: String?
    @Published var isPlaying: Bool = false

    private var codeVerifier: String = ""

    init() {
        loadTokens()
        refreshAccessTokenIfNeeded()
    }
    
    // MARK: - Step 1: Request Authorization Code
    func requestAuthorization() {
        codeVerifier = generateCodeVerifier()
        let codeChallenge = generateCodeChallenge(from: codeVerifier)
        
        // ✅ Added missing scopes for playback control and currently playing track
        let scopes = [
            "user-read-private",
            "user-read-email",
            "user-read-currently-playing",
            "user-read-playback-state",
            "user-modify-playback-state"
        ].joined(separator: "%20") // Spotify requires scopes to be space-separated (`%20` encoding)

        let authURL = URL(string: """
        https://accounts.spotify.com/authorize?client_id=\(clientID)&response_type=code&redirect_uri=\(redirectURI)&code_challenge_method=S256&code_challenge=\(codeChallenge)&scope=\(scopes)
        """)!
        
        DispatchQueue.main.async {
            let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: "hellospotify2") { callbackURL, error in
                if let error = error {
                    print("Spotify Auth Error: \(error.localizedDescription)") // ✅ Debugging
                    return
                }
                
                if let url = callbackURL {
                    self.handleAuthorizationResponse(url: url)
                } else {
                    print("Spotify authentication failed: No callback URL received.") // ✅ Debugging
                }
            }
            session.start()
        }
    }

    
    // MARK: - Step 2: Handle Authorization Response
    private func handleAuthorizationResponse(url: URL) {
        if let code = URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?.first(where: { $0.name == "code" })?.value {
            exchangeCodeForToken(authorizationCode: code)
        }
    }
    
    // MARK: - Step 3: Exchange Code for Access & Refresh Token
    private func exchangeCodeForToken(authorizationCode: String) {
        let tokenURL = URL(string: "https://accounts.spotify.com/api/token")!
        
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyParameters = "client_id=\(clientID)&grant_type=authorization_code&code=\(authorizationCode)&redirect_uri=\(redirectURI)&code_verifier=\(codeVerifier)"
        
        request.httpBody = bodyParameters.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let token = json["access_token"] as? String,
               let refresh = json["refresh_token"] as? String {
                
                DispatchQueue.main.async {
                    self.accessToken = token
                    self.refreshToken = refresh
                    self.isAuthenticated = true
                    self.saveTokens()
                    self.fetchUserProfile() // ✅ Automatically fetch user profile after login
                }
            }
        }.resume()
    }
    // MARK: - Refresh Access Token when it expires
    func refreshAccessToken() {
        guard let refreshToken = refreshToken else {
            print("No refresh token available")
            return
        }

        let tokenURL = URL(string: "https://accounts.spotify.com/api/token")!
        
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyParameters = "client_id=\(clientID)&grant_type=refresh_token&refresh_token=\(refreshToken)"
        request.httpBody = bodyParameters.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to refresh access token: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let newAccessToken = json["access_token"] as? String {
                
                DispatchQueue.main.async {
                    self.accessToken = newAccessToken
                    self.isAuthenticated = true
                    self.saveTokens()
                    print("Access token refreshed successfully!")
                }
            } else {
                print("Failed to parse refresh token response")
            }
        }.resume()
    }
    

    
    // MARK: - Step 4: Fetch User Profile
    func fetchUserProfile() {
        guard let token = accessToken else {
            print("No access token available")
            return
        }

        let url = URL(string: "https://api.spotify.com/v1/me")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }

            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let displayName = json["display_name"] as? String {

                var profileImageURL: String? = nil
                if let images = json["images"] as? [[String: Any]], let firstImage = images.first {
                    profileImageURL = firstImage["url"] as? String
                }

                DispatchQueue.main.async {
                    self.userName = displayName
                    self.userProfileImage = profileImageURL
                    print("User Profile: \(displayName)")
                }
            }
        }.resume()
    }
    
    func fetchCurrentlyPlayingTrack() {
        guard let token = accessToken else {
            print("No access token available")
            return
        }

        let url = URL(string: "https://api.spotify.com/v1/me/player/currently-playing")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching currently playing track: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let item = json["item"] as? [String: Any],
                   let trackName = item["name"] as? String,
                   let artists = item["artists"] as? [[String: Any]],
                   let firstArtist = artists.first,
                   let artistName = firstArtist["name"] as? String,
                   let album = item["album"] as? [String: Any],
                   let images = album["images"] as? [[String: Any]],
                   let albumCover = images.first?["url"] as? String,
                   let isPlaying = json["is_playing"] as? Bool {
                    
                    DispatchQueue.main.async {
                        self.currentTrack = trackName
                        self.currentArtist = artistName
                        self.albumCoverURL = albumCover
                        self.isPlaying = isPlaying
                        print("Now Playing: \(trackName) by \(artistName)")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.currentTrack = nil
                        self.currentArtist = nil
                        self.albumCoverURL = nil
                        self.isPlaying = false
                        print("No track currently playing.")
                    }
                }
            }
        }.resume()
    }
    
    private var timer: Timer?

    func startAutoRefresh() {
        fetchCurrentlyPlayingTrack() // ✅ Fetch immediately
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            self.fetchCurrentlyPlayingTrack()
        }
    }

    func stopAutoRefresh() {
        timer?.invalidate()
        timer = nil
    }


    // MARK: - Step 5: Auto-Refresh Token Every 55 Minutes
    private func refreshAccessTokenIfNeeded() {
        Timer.scheduledTimer(withTimeInterval: 3300, repeats: true) { _ in // 55 minutes
            self.refreshAccessToken()
        }
    }

    // MARK: - Step 6: Store & Retrieve Tokens from UserDefaults
    private func saveTokens() {
        UserDefaults.standard.set(accessToken, forKey: "SpotifyAccessToken")
        UserDefaults.standard.set(refreshToken, forKey: "SpotifyRefreshToken")
    }

    private func loadTokens() {
        accessToken = UserDefaults.standard.string(forKey: "SpotifyAccessToken")
        refreshToken = UserDefaults.standard.string(forKey: "SpotifyRefreshToken")
        isAuthenticated = (accessToken != nil)
    }
}
