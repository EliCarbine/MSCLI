//
//  WegovApp.swift
//  Wegov
//
//  Created by Admin on 1/7/24.
//

import SwiftUI


@main
struct WegovApp: App {
    
 
   // @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
      
        }
    }

struct topBill{
    let congress:String
    let latestAction:String
    let number:Int
    let originChamber:String
    let originChambercode:Character
    let title:String
    let type:String
    let updateDate:String
}

//class AppDelegate: NSObject, UIApplicationDelegate


