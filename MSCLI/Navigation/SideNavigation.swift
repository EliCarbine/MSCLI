//
//  SideNavigation.swift
//  Wegov
//
//  Created by Admin on 3/25/24.
//

import SwiftUI

struct SideNavigation: View {
    var body: some View {
        VStack {
            Group{
                Text("Profile")
                    .font(Font.custom("Futura-Medium", size: 40))
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .colorInvert()
                Divider()
                    .colorInvert()
                
                Text("Your Stats")
                    .font(Font.custom("Futura-Medium", size: 40))
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .colorInvert()
                
                
                Divider()
                    .colorInvert()
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color.black)
        .edgesIgnoringSafeArea(.vertical)
        .opacity(0.8)
        
    }
}

struct SideNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SideNavigation()
    }
}
