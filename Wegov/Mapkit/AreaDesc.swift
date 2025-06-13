//
//  AreaDesc.swift
//  MSCLI
//
//  Created by Admin on 3/27/24.
//

import SwiftUI

struct AreaDesc: View {
    @State private var favLocation = false
    
    var body: some View {
                VStack(alignment:.leading, spacing: 2){
                    //Coordinate location
                    Text("In the Area")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    // .offset(x: -60)

                    HStack(spacing: 3){
                        //Number sibject to change
                        Text("2.5K")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Text("Listeners Around")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Spacer()
                        
                        //Save coordinate location
                        Button(action: {
                            favLocation.toggle()
                        }){
                            Image(systemName: favLocation ? "star.fill" :
                                    "star")
                            .foregroundColor(Color.black)
                        }
                    }
                    
                }
                .frame(width: 375, height:80)
                .padding([.top, .leading,.trailing],10)
        
    }
}

struct AreaDesc_Previews: PreviewProvider {
    static var previews: some View {
        AreaDesc()
    }
}
