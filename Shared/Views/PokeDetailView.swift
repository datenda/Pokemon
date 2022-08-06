//
//  PokeDetailView.swift
//  PokemonFinal
//
//  Created by bro on 27/07/2022.
//

import SwiftUI

struct PokeDetailView: View {
    @State var pokemon = [PokemonEntry]()
    @State var pokemon2 = [PokemonEntrySec]()
    @State var pokemon3 = [PokemonEntryThr]()
    @AppStorage ("STRING_KEY") var status = ""
    @State private var text = ""
    @State private var pokemons: [Poke] = [Poke]()
    @State private var nomepoke: String = ""
    @State private var hpstat: Int = 1
    @State private var defensestat: Int = 1
    @State private var typestat: String = ""
    let coreDM: CoreDataManager
    var imglink: String = ""
    var name: String = ""
    var hp: Int = 1
    var defense: Int = 1
    var attack: Int = 1
    
    var body: some View {
        VStack{
            PokemonImage(imageLink: "\(imglink)")
            Text(name).font(.title).padding(.bottom, 5)
            List{
                Text("STATS").font(.title2).bold()
                ForEach(pokemon2) { meh in
                    Text(meh.stat!.name)
                    StatView(pokemon2: pokemon2, statColor: .blue, statValue: meh.base_stat)
                }
                Text("Types").font(.title2).bold()
                    HStack{
                        ForEach(pokemon3){ bruh in
                            Text(bruh.type!.name).font(.title3)
                }
            
            
                }.onAppear(){
                        PokeApi2().getData2(name: name) { pokemon in
                            self.pokemon2 = pokemon
                            
                        }
                        PokeApi3().getData3(name: name) {pokemon in
                            self.pokemon3 = pokemon
                            }
                
                    }
            }
            
            NavigationLink("Start battle".capitalized ,destination: PokebattleVIew(imglink: imglink))
        }
    }


struct PokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDetailView(coreDM: CoreDataManager())
    }
}
}
