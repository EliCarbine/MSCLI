//
//  Your Stats.swift
//  Wegov
//
//  Created by Admin on 3/28/24.
//

import SwiftUI

struct muScore: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                }){
                    Label("Your Stats",systemImage:"chart.bar.xaxis.ascending")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .underline()
                    
                }
                Spacer()
            }
            .padding(.horizontal,7)
        }
        Spacer(minLength: 300)
    }
}

struct muScore_Previews: PreviewProvider {
    static var previews: some View {
        muScore()
    }
}
