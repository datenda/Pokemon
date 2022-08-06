//
//  ButtonView.swift
//  PokemonFinal
//
//  Created by bro on 30/07/2022.
//

import SwiftUI

struct ButtonView: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View {
        ZStack {
            Capsule()
                .frame( height: 50)
                .foregroundColor(isSelected ? color : .gray)
            Text(text)
                .foregroundColor(.white)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(isSelected: .constant(false),color: .blue, text: "Option")
    }
}
