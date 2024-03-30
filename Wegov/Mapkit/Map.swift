//
//  Map.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    // @Binding var manager: CLLocationManager
    // @Binding var alert: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        let center = CLLocationCoordinate2D(latitude: 40.630234,longitude: -73.944640)
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 250, longitudinalMeters: 200)
        
        
        mapView.region = region
        return mapView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
 //   let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
  //  mapView.region = coordinateRegion
    }
    }
    
    //FUNCTIONS
    func updateUIView(_ view: MKMapView, context: Context) {
    
    }
}


