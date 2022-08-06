//
//  StatView.swift
//  PokemonFinal
//
//  Created by bro on 28/07/2022.
//

import SwiftUI

struct StatView: View {
    @State var pokemon2 = [PokemonEntrySec]()
    var statColor: Color
    var statValue: Int
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 150, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue <= 100 ? 150 * (CGFloat(statValue) / 100): 150, height: 20)
            }
            Text("\(statValue)").font(.system(.body, design: .monospaced))
            
        }
        
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(statColor: .blue, statValue: 55)
    }
} 
