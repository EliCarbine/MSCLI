//
//  MainNav.swift
//  Wegov
//
//  Created by Admin on 3/30/24.
//

import SwiftUI

struct MainNav: View {
    var body: some View {
        VStack(){
            
        Spacer(minLength: 250)
            AreaDesc()
            Divider()
        ScrollView(.vertical){
       
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
        .offset(y:-8)
        .frame(height:.infinity)
        .ignoresSafeArea(.container)
        }
      
    }
}

struct MainNav_Previews: PreviewProvider {
    static var previews: some View {
        MainNav()
    }
}
