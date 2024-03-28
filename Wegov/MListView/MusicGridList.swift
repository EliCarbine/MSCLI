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
    @State private var numRows = 2
    
    var numberArt = ["WLR","offset","Graduation","vul","metro",
                     "damn","doobie","beetle","dela","drake","wu","bey","big","blonde","chance","gunna","sza","nav"]
    private let colors: [Color] = [.red,.blue,.black,.purple,.green,.yellow,.mint,.black,.cyan]
    
    let gridRows = [
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150))]
       
    let gridRows2 = [
            GridItem(.adaptive(minimum: 150)),
            GridItem(.adaptive(minimum: 150)),
            GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        VStack{
            HStack(){
                Text("Top Nearby Tracks")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding([.leading, .bottom],2)
                
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
                    
                    
                }
            }
            .padding(.all,2)
            .offset(y:10)
        
            if isHorizontal {
         let grid = ScrollView(.horizontal){
                LazyHGrid(rows: gridRows,spacing: 10){
                    ForEach(numberArt, id: \.self) { numberArt in
                        Button(action: {
                        }){
                        let coverDesc =  Image(numberArt)
                                .resizable()
                               // .scaledToFill()
                                .aspectRatio( contentMode: .fill)
                            coverDesc
                        }
                    }
                    .padding(.bottom,1)
                    .frame(width: 80,height: 80)
                    .cornerRadius(20)
                    .shadow(color: .red,radius: 3)
                }
               
                .padding(.leading,5 )
                .frame(width: .infinity,height: 195, alignment: .leading)
            }
                .padding(.all,1)
            .frame(maxWidth: .infinity)
            
    
           
                //Default display
                grid
            } else {
              //  Vertical
                let vgrid = ScrollView(.vertical){
                       LazyVGrid(columns: gridRows2,spacing: 10){
                           ForEach(numberArt, id: \.self) { numberArt in
                               Button(action: {
                               }){
                               let coverDesc =    Image(numberArt)
                                       .resizable()
                                       .scaledToFill()
                                      .aspectRatio( contentMode: .fill)
                                   coverDesc
                               }
                           }
                           .padding(.bottom,1)
                           .frame(width: 80,height: 80)
                           .cornerRadius(20)
                           .shadow(color:.red,radius: 3)
                       }
                       .padding([.top, .leading, .bottom],5 )
                       .frame(width: .infinity,height: .infinity, alignment: .leading)
                   }
                       .padding(.all,1)
                   .frame(maxHeight:.infinity)
                   
            vgrid
                
            }
            //Divider()
               
                //.frame(width: 380)
        }
    }
}
struct MusicGridList_Previews: PreviewProvider {
    static var previews: some View {
        MusicGridList()
    }
}
