//
//  Title.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI

struct Title: View {
    var body: some View {
        
        HStack(alignment: .center){
            Button(action: {
                
            }){
                Image(systemName:"person.crop.circle.fill")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:50, height: 50)
                    .foregroundColor(.gray)
            }
            //  .foregroundColor(Color("CColor"))
            .shadow(radius: 8)
            // .offset(x:-40)
            
            Text(" MusiCali ")
                .font(Font.custom("RollingBold-PersonalUse", size: 40))
                .shadow(radius: 2)
                .frame(width: 201.0,height: 40)
                .padding(.horizontal,35)
                .padding(.top,10)
            
            //
            Button(action: {
                //Settings Side navbar
                
            }){ Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width:40, height:26,alignment: .trailing)
                    .scaledToFit()
                    .offset(y:6)
                    .shadow(radius: 3)
            }
        }
        .padding(.all,4)
        
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
