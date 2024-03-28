//
//  FriendsList.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI



struct FriendsList: View {
    private var profile = ["cam","guy","baghead","anime","anime2","pro1","pro2","pro3","pro4","pro5","pro6","pro7","pro8"]
  
        
    var body: some View {
        VStack{
            HStack{
                Text("Your Friends")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                
                Spacer()
            }.padding(.leading,8)
            ScrollView(.horizontal){
                VStack{
                    HStack(spacing: 10){
                        ForEach(profile, id: \.self) { profile in
                            
                            Button(action: {
                            }){
                                Image(profile)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width:70, height: 70)
                                    .shadow(radius: 3)
                            }
                        }
                    }
                    Text("User Name")
                        .foregroundColor(.black)
                }
            }
            .padding(.leading,4)
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
