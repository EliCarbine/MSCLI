
import SwiftUI

struct SpotifyLoginView: View {
    @StateObject private var authViewModel = SpotifyAuthViewModel()
    
    var body: some View {
        VStack {
            if authViewModel.isAuthenticated {
                Text("Logged into Spotify ✅")
                    .font(.headline)
                    .padding()
                
                Button("Fetch Profile") {
                    authViewModel.fetchUserProfile()  }
                
                .padding()
            } else {
                Button("Login with Spotify") {
                    authViewModel.requestAuthorization()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}
struct Spotify_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyLoginView()
    }
}
