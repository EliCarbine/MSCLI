//
//  ContentView.swift
//  Wegov
//
//  Created by Admin on 1/7/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    
    //State Variables
    //   @State private var favLocation = false
    
    
    // @StateObject private var locationManager = LocationManager()
    // @State private var gridList
    
    //LOCATION MAP
    /* class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
     private let locationManager = CLLocationManager()
     
     override init() {
     super.init()
     locationManager.delegate = self
     }
     }*/
    // @StateObject private var locationManager = LocationManager()
    
    
    //MAP STRUCT
    /* struct MapView: UIViewRepresentable {
     // @Binding var manager: CLLocationManager
     // @Binding var alert: Bool
     
     func makeUIView(context: Context) -> MKMapView {
     let mapView = MKMapView()
     
     let center = CLLocationCoordinate2D(latitude: 40.630234,longitude: -73.944640)
     
     let region = MKCoordinateRegion(center: center, latitudinalMeters: 250, longitudinalMeters: 200)
     
     mapView.region = region
     
     return mapView
     // MKMapView()
     
     // LOACATION MANAGAER
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     if let location = locations.first {
     let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
     mapView.region = coordinateRegion
     }
     }
     }
     //FUNCTIONS
     func updateUIView(_ view: MKMapView, context: Context) {
     
     }
     
     }
     
     */
    //SCREEN
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors:[ Color("AColor"),Color("BColor")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical){
                
                //Top of page
                VStack(){
                  Title()
                    
                }
   
                // THE MAP
                /* MapView()
                 .edgesIgnoringSafeArea(.all)
                 .padding(.bottom)
                 .frame(height: 350)
                 .offset(x:0,y:-8)*/
                // .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                
                Spacer()
     
                //Nearby Tracks
                AreaDesc()
                MusicGridList()
                
               FriendsList()
                
            }
        }
    
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

