//
//  MainNav.swift
//  MSCLI
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
           
            //FriendList
            FriendsList()
            Divider()
            
            //Statistics
            muScore()
            
            
        }
        .offset(y:-8)
        .ignoresSafeArea(.container)
        }
      
    }
}

struct MainNav_Previews: PreviewProvider {
    static var previews: some View {
        MainNav()
    }
}
