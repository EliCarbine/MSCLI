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

   
    // MKMapView()

     // LOACATION MANAGAER
     
     
  
    //SCREEN
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors:[ Color("AColor"),Color("BColor")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            //Scroll
            ScrollView(.vertical){
                //Top of page
                VStack(spacing:0){
                    
                    Title()
                    
                    
                    MapView()
                        .edgesIgnoringSafeArea(.top)
                        .padding(.bottom)
                        .frame(height: 400)
                        .offset(x:0,y:-8)
           
                    // .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
     
                //Area Decription
                AreaDesc()
                Divider()
                //Top Nearby Listings
                MusicGridList()
                Divider()
                    .frame(width: 350)
                //FriendList
               FriendsList()
                Divider()
                    .frame(width: 300)
                
            //Statistics
                muScore()
                
            }
        }
    
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


