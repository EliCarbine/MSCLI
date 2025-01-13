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
    
   
    var body: some View {
        
        Map{
            
            Annotation("Philip Howard", coordinate: .start, anchor: .top){
                
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        
        //        func makeUIView(context: Context) -> MKMapView {
        //            let mapView = MKMapView()
        //
        //            let center = CLLocationCoordinate2D(latitude: 40.630234,longitude: -73.944640)
        //
        //            //Zoom
        //            let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        //
        //            mapView.region = region
        //
        //            return mapView
    }
    
}
        //Track location
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            if let location = locations.first {
                let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                
                //mapView.region = coordinateRegion
            }
        }
        
        //FUNCTIONS
//        func updateUIView(_ view: MKMapView, context: Context) {
//            
//        }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
