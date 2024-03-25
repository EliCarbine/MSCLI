//
//  ContentView.swift
//  Wegov
//
//  Created by Admin on 1/7/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //LIST
    private var numberArt = ["WLR","metro","Graduation","blonde","gunna",
    "damn","doobie","beetle","dela","drake"]
  
    //GRID
    private let gridRows = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 150))
    ]
    private let gridRows2 = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 150))
    ]
    
    //State Variables
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var lsgrButton = true
   
    struct ButtonView: View{
        var body: some View {
            Button(action: {
            }){
                Image(systemName: "square.grid.3x2.fill")
            }
        }}
   // @State private var gridList
  
    let ceoverArt = [
        Image("Graduation")
    ]
    // Area desc Structs
    struct CellView: View{
        var body: some View {
          
            VStack(alignment:.leading, spacing: 2){
                //Coordinate location
                    Text("This Area")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                       // .offset(x: -60)
                HStack(spacing: 3){
                    Text("2.4k")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("People Listening Near You")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                }
            }
            .padding(.leading,4)
            .frame(width:424, alignment: .leading)
        }
    }
    
    struct coverArt: Identifiable {
        let id: UUID
        let imageName: String
        
        init(imageName: String) {
            self.id = UUID()
            self.imageName = imageName
        }
    }
    
    
    let imageItems: [coverArt] = [
        coverArt(imageName: "Graduation"),
        coverArt(imageName: "WLR"),
        coverArt(imageName: "drake")
    ]
    //MAP STRUCT
    struct MapView: UIViewRepresentable {
        func makeUIView(context: Context) -> MKMapView {
            MKMapView()
                
        }
        
        func updateUIView(_ view: MKMapView, context: Context) {
     
        }
    }
    //SCREEN
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors:[ Color("AColor"),Color("BColor")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                //Top of page
                VStack(){
                    HStack(alignment: .center){
                        
                        Image(systemName:"aqi.medium")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width:50, height: 50)
                            .foregroundColor(Color("CColor"))
                            .shadow(radius: 8)
                        // .offset(x:-40)
                        
                        Text(" MusiCali ")
                            .font(Font.custom("RollingBold-PersonalUse", size: 40))
                            .shadow(radius: 2)
                            .frame(width: 201.0,height: 40)
                            .padding(.horizontal,35)
                            .padding(.top,10)
                        
                        //
                        Image(systemName: "line.3.horizontal.decrease")
                            .resizable()
                        
                            .frame(width:40, height:23,alignment: .trailing)
                            .scaledToFit()
                            .offset(y:6)
                            .shadow(radius: 3)
                        
                    }
                    .offset(y:-10)
                    
                }
            
                    
                
                //Group
                Divider()
                
                // THE MAP
                MapView()
                    .frame(height: 350)
                    .offset(x:0,y:-8)
                
                Spacer()
                
                
                //Nearby Tracks
                    CellView()
                    

                HStack(){
                        Text("Top Nearby Tracks")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding([.leading, .bottom],4)
                        
                    Spacer()
                        .frame(width: 210)
                    
                    Image(systemName: "square.grid.3x2.fill")
                        //.resizable()
                        .foregroundColor(Color.white)
                        .padding(.trailing,5)
                        .frame(width: 25,height:18)
                        .scaledToFit()
                        
                   //GridList
                  /* Button(action: {
                        lsgrButton.toggle()
                    }){
                        
                        Image(lsgrButton ? "square.grid.3x2.fill") //"list.dash")
                            .resizable()
                            .padding(.trailing,5)
                            .frame(width: 25,height:16)
                            .scaledToFit()
                        
                            .foregroundColor(Color.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    */
                    }
                    
                
        
                // .offset(x:112)
                Divider()
              //  GeometryReader { geometry in
                ScrollView(.horizontal){
                   // GeometryReader { geometry in
                    LazyHGrid(rows: gridRows,spacing: 5){
                        ForEach(numberArt, id: \.self) { numberArt in
                            Image(numberArt)
                                .resizable()
                        }
                   // }
                            .padding(.bottom,1)
                            .frame(width: 80,height: 80)
                            .cornerRadius(20)
                            .shadow(color:.red,radius: 3)
                            
                        }
                        .padding(.leading,5 )
                        .frame(width: 430,height: 195, alignment: .leading)
                        
                    }
                    .frame(maxWidth: .infinity)
                
                    
                    Group{
                        HStack{
                            Button("Your Friends",action: {
                                
                            } )
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        }
                        .offset(x:-140)
                        
                        Divider()
                        
                        ScrollView(.horizontal){
                            VStack{
                                HStack(spacing: 8){
                                    Image("cam")
                                        .resizable()
                                        .scaledToFill()
                                    
                                        .clipShape(Circle())
                                        .frame(width:70, height: 70)
                                        .shadow(radius: 3)
                                    
                                    
                                    Image("baghead")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width:70, height: 70)
                                        .shadow(radius: 3)
                                    
                                    Image("guy")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width:70, height: 70)
                                        .shadow(radius: 3)
                                    Image("anime")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width:70, height: 70)
                                        .shadow(radius: 3)
                                    
                                }
                                .padding([.top, .leading],5)
                                /* Text("Placeholder Name")
                                 .font(.footnote)
                                 .frame(width: 0.0)*/
                            }
                        }
                    }//group
                    
                }
            }
            
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    
    
    enum Tab: String, CaseIterable{
        case Profile
        case Friends
        case Map
        
    }
