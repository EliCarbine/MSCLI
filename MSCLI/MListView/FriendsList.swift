//
//  FriendsList.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI

struct FriendsList: View {
    
    @State var scrollText = false

    private var profile = ["demon","mike","baghead","guy","anime2","pro1","pro2","pro3","pro4","pro5","pro6","pro7","pro8"]
  
        
    var body: some View {
        VStack{
            HStack{
                Text("Your Friends")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                
                Spacer()
            }
            .padding(.leading,8)
            ScrollView(.horizontal){
                VStack{
                    HStack(spacing: 10){
                        ForEach(profile, id: \.self) { profile in
                            Button(action: {
                            //Friend profile button
                            }){
                                VStack(spacing:0){
                                    Group {
                                        Image(profile)
                                            .resizable()
                                            .scaledToFill()
                                            .padding(.zero)
                                            .clipShape(Circle())
                                            .frame(width:70, height: 70)
                                            .shadow(radius: 4)
                                        
                                        Image(systemName: "message.badge.waveform.fill")
                                            .foregroundColor(Color("AColor"))
                                            .position(x:75,y:-10)
                                            .frame(height: 5)
                                
                                           // .offset(x: 20,y:-20)
                                           // .frame(width: 70,height:20)
                                    }
                                    Text("Currently Playing")
                                       .frame(width: 90,height: 20,alignment: .leading)
                                      .padding(.all,1)
                                      .offset(x:5)
//                                      .offset(x: scrollText ? -182:600)
                            
                                    Text("Username")
                                        .frame(width: 90, height: 20)  .foregroundColor(Color.black)
                                        .padding(.vertical,1)
                                        .shadow(radius: 0.5)
                
                                        

                                        
                                }
                             
                                .padding(.horizontal,5)
                                .frame(height:140)
                            }
                        }
                    }
                }
            }
            .frame(width: 400)
            .padding(.horizontal,5)
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
