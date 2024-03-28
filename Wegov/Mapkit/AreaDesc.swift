//
//  AreaDesc.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI

struct AreaDesc: View {
    @State private var favLocation = false
    
    var body: some View {
                VStack(alignment:.leading, spacing: 2){
                    //Coordinate location
                    Text("This Area")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    // .offset(x: -60)
                    HStack(spacing: 3){
                        Text("2.4k")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Text("People Listening Around")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Spacer()
                        
                        Button(action: {
                            favLocation.toggle()
                        }){
                            Image(systemName: favLocation ? "star.fill" :
                                    "star")
                            .foregroundColor(Color.black)
                
                        }
                    }
                }
                .padding(.horizontal,7)
        
    }
}

struct AreaDesc_Previews: PreviewProvider {
    static var previews: some View {
        AreaDesc()
    }
}
