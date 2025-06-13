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
//Album Covers
    var numberArt = ["Childish","Lucki","Larry","yaet","earl",
                        "damn","doobie","dela","beetle","drake","wu","bey","mos","blonde","chance","gunna","sza","nav"]
    
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
                       .padding([.leading, .bottom,.top],2)
                       .frame(width: 150)
                   
                      
                   
                   Spacer()
                       .frame(width: 200)
                   
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
                // HORRIZONTAL Grid of songs
                   LazyHGrid(rows: gridRows,spacing: 10){
                       // For Loop of Art/Songs
                       ForEach(numberArt, id: \.self) { numberArt in
                           Button(action: {
                           }){
                               let coverDesc =
                               VStack(spacing:-2){
                                   Image(numberArt)
                                       .resizable()
                                    .scaledToFit()
                                       .aspectRatio( contentMode: .fill)
                                       .frame(width: 80,height: 80)
                                       .cornerRadius(20)
                                       .shadow(color: .black,radius: 4)
                                   
                                   Text("Artists - Song Title ")
                                       .fontWeight(.semibold)
                                       .foregroundColor(Color.black)
                                       .frame(width:90,height:60)
                                       .padding(.vertical,2)
                                       .shadow(radius: 0.01)
                                       .shadow(color: .black,radius: 0.05)
                               }
                               
                               coverDesc
                               
                           }
                       }
                       .padding([.bottom],1)
                   }
                   .padding(.leading,5)
                  .padding(.top,20)
                  
                   .frame(width: .infinity,height: 330, alignment: .leading)
               }
                   .padding(.all,1)
               .frame(maxWidth: .infinity)
     
                   //Default display
                   grid
               } else {
                   
//                 let twoList =  List(numberArt,id: \.self) { i in
//                       
//                       Image(i)
//                           .resizable()
//                                                            .scaledToFill()
//                                                                .aspectRatio( contentMode: .fill)
//                                                                    .frame(width: 80,height: 80)
//                                                                    .cornerRadius(20)
//                                    .shadow(color:.black,radius: 3)
//                       
//                   }
//                   twoList
                   // Vertical Grid of songs
                   let vgrid = ScrollView(.vertical){
                       LazyVStack(alignment: .leading,spacing: 10){
                              ForEach(numberArt, id: \.self) { numberArt in
                                  Button(action: {
                                  }){
                                      HStack (spacing: 1){
                                          
                                          let coverDesc =
                                          Text("Artists - Song Title ")
                                              .fontWeight(.semibold)
                                              .foregroundColor(Color.black)
                                              .frame(width:200.0,height:70)
                                              .padding(.vertical,1)
                                              .shadow(color: .black,radius: 0.05)
                                          
                                          
                                          Image(numberArt)
                                              .resizable()
                                              .scaledToFill()
                                              .aspectRatio( contentMode: .fill)
                                              .frame(width: 80,height: 80)
                                              .cornerRadius(20)
                                              .shadow(color:.black,radius: 3)
                                          
                                         
                                          
                                          coverDesc
                                      }
                                      
                                      Image(systemName: "plus")
                                          .aspectRatio(contentMode: .fill)
                                          .foregroundColor(Color.black)
                                          .frame(width: 60, alignment: .trailing)
                                          .padding(.all)
                                          .bold()
                                  
                                  }
                                  Divider()
                                    
                              }
                              .padding(.bottom,10)
                          }
                          .padding([.top, .leading, .bottom],15 )
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
