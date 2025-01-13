//
//  Title.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI

struct Title: View {
  //  @State public var bottomSheet:Bool = true
  //  @Binding var bottomNav:Bool
    
    var body: some View {
        VStack(alignment: .center){
            HStack(alignment: .center, spacing: 1){
                Button(action: {
                 //   bottomNav.toggle()
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
                Spacer(minLength: 30)
                Text(" MusiCali ")
                    .font(Font.custom("RollingBold-PersonalUse", size: 40))
                    .shadow(radius: 2)
                   .frame(width: 201.0,height: 40)
                    .padding(.horizontal,35)
                 .padding(.top,10)
                 .offset(x:-18)
                
                
                 Button(action: {
                 //Settings Side navbar
                 
                 }){ Image(systemName: "line.3.horizontal.decrease")
                 .resizable()
                 .foregroundColor(.black)
                 .frame(width:40, height:26,alignment: .trailing)
                 .scaledToFill()
                 .offset(y:0)
                 .shadow(radius: 3)
                 }
                 }
            .padding([.top, .leading, .trailing],42)
            Spacer()
            }
        
        }
    }

struct Title_Previews: PreviewProvider {
  
    static var previews: some View {
       Title()
   }
}
