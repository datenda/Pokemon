//
//  PokemonPartyView.swift
//  PokemonFinal
//
//  Created by bro on 02/08/2022.
//

import SwiftUI

struct PokemonPartyView: View {
    let coreDM: CoreDataManager
    @State private var pokemons: [Poke] = [Poke]()
    var body: some View {
        List(pokemons, id: \.self){poky in
            Text(poky.pokenome ?? "")
            
        }.onAppear(perform: {
            pokemons = coreDM.getPoke()
        })
    }
}

struct PokemonPartyView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonPartyView(coreDM: CoreDataManager())
    }
}
