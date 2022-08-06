//
//  ContentView.swift
//  PokemonFinal
//
//  Created by bro on 27/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    let coreDM: CoreDataManager
    
    var body: some View {
        NavigationView {
            
            List {
                
                NavigationLink("Pokemon Team".capitalized ,destination: PokemonPartyView(coreDM: CoreDataManager()))
                
                ForEach(searchText == "" ? pokemon: pokemon.filter( {$0.name.contains(searchText.lowercased())} )) {
                    entry in
                    
                    HStack {
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)
                        
                        NavigationLink("\(entry.name)".capitalized ,destination: PokeDetailView(coreDM: CoreDataManager(), imglink: entry.url, name: entry.name))
                    }
                }
            }
            
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

