//
//  MusicGridList.swift
//  Wegov
//
//  Created by Admin on 3/27/24.
//

import SwiftUI

struct MusicGridList: View {
    
    @State private var isHorizontal = true
    @State private var lsgrButton = false
    
    var numberArt = ["WLR","offset","Graduation","vul","metro",
                     "damn","doobie","beetle","dela","drake","wu","bey","big","blonde","chance","gunna","sza","nav"]
    let gridRows = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 150))]
    var body: some View {
        VStack{
            HStack(){
                Text("Top Nearby Tracks")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.leading,2)
                
                Spacer()
                    .frame(width: 240)
                
                Button(action: {
                    lsgrButton.toggle()
                    isHorizontal.toggle()
                }){
                    Image(systemName:lsgrButton ? "square.grid.3x3.fill" : "rectangle.grid.2x2.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.black)
                        .padding(.trailing,5)
                        .frame(width: 25,height:25)
                    if isHorizontal {
                        //Default display
                        
                    } else {
                      //  Vertical
                    }
                }
            }
            .padding([.top, .leading, .trailing],2)
            .offset(y:10)
        
               
            ScrollView(.horizontal){
                LazyHGrid(rows: gridRows,spacing: 6){
                    ForEach(numberArt, id: \.self) { numberArt in
                        Button(action: {
                        }){
                            Image(numberArt)
                                .resizable()
                                .scaledToFill()
                        }
                    }
                    .padding(.bottom,1)
                    .frame(width: 80,height: 80)
                    .cornerRadius(20)
                    .shadow(color:.red,radius: 3)
                }
                .padding(.leading,5 )
                .frame(width: .infinity,height: 195, alignment: .leading)
            }
            .padding(.vertical,1)
            .frame(maxWidth: .infinity)
            Divider()
                .frame(width: 380)
        }
    }
}
struct MusicGridList_Previews: PreviewProvider {
    static var previews: some View {
        MusicGridList()
    }
}
