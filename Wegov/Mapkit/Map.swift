//
//  Map.swift
//  MSCLI
//
//  Created by Admin on 3/27/24.
//

import SwiftUI
import MapKit
import CoreLocation




extension CLLocationCoordinate2D {
    static let start = CLLocationCoordinate2D(latitude: 40.630234,longitude: -73.944640)
        
}

//Map Struct
struct MapView: View {
    // @Binding var manager: CLLocationManager
    // @Binding var alert: Bool
    
   
    @State private var camera: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: .start,
            span: MKCoordinateSpan(latitudeDelta: 0.0, longitudeDelta: 0.05) // Adjust zoom here
            )
        )
        
    @State private var camregion:MKCoordinateRegion?
    
    @State private var Favloc: [MKCoordinateRegion] = []
   
    var body: some View {
        
        Map (position: $camera){
           
            
            
            
            
            Annotation("Artist - Song Name", coordinate: .start, anchor: .top){
                ZStack{
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(.background)
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(.secondary,lineWidth: 3)
                    Image("chance")
                        .resizable()
                     .scaledToFit()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 45,height: 45)
                        .cornerRadius(20)
                        .shadow(color: .black,radius: 4)
                    
                }
                
            }
            
        }
        .mapStyle(.standard(elevation: .realistic))
        
       
        
    }
    
}
        //Track location
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
//            if let location = locations.first {
//                let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
//                
//            }
        }

struct FavLocations: View {
    @Binding var position: MapCameraPosition
    
    @Binding var search: [MKMapItem]
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

