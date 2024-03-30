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
    @State  var bottomSheet:Bool = true
  
    //SCREEN
    var body: some View {
        
        ZStack{
           
                    MapView()
                        .edgesIgnoringSafeArea(.top)
                        .cornerRadius(20)
                    Title()
               .padding(.top,10)
          
         
            }
        .edgesIgnoringSafeArea(.all)
       // .frame(height: 960)
        .sheet(isPresented: $bottomSheet){
            ZStack{
                LinearGradient(gradient: Gradient(colors:[ Color("AColor"),Color("BColor")]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 960)
                
                MainNav()
                    .presentationDetents([.fraction(0.55),.large])
                    .presentationDragIndicator(.visible)
                   
                    
                    
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


