//
//  PokebattleVIew.swift
//  PokemonFinal
//
//  Created by bro on 03/08/2022.
//

import SwiftUI

struct PokebattleVIew: View {
    var imglink: String = ""
    var imagemenem: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(Int.random(in: 1..<151)).png"
    @State private var hpmax: Double = 100.0
    @State private var hpcur: Double = 100.0
    @State private var hpmax1: Double = 100.0
    @State private var hpcur1: Double = 100.0
    @AppStorage ("NUMBER_KEY") var xp = 1
    @AppStorage ("STRING_KEY") var poke = ""
    @State var pokemon4 = [PokemonEntryFr]()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("primeiro de update aos seus stats no caso de trocar de pokemon ").padding(5).border(Color.gray).onTapGesture{
                    if (poke != imglink){
                        xp = 1
                    }
                    else{
                        hpcur = 100+Double(xp)
                        hpmax = hpcur
                    }
                }
                if(hpcur1<=0){
                    Text("Ganhaste, a cada batalha que ganhas ficas cada vez mais forte").onTapGesture{
                        xp+=1
                        hpcur = 100+Double(xp)
                        hpmax = hpcur
                        hpcur1 = 100
                    }
                    
                }
                if(hpcur<=0){
                    Text("perdeste").onTapGesture{
                        xp = 1
                        hpcur = 100+Double(xp)
                        hpmax = hpcur
                        hpcur1 = 100
                    }
                }
                Spacer()
                ProgressView("hp \(Int(hpcur)) / \(Int(hpmax))", value: hpcur, total: hpmax)
                Text("level: \(xp)")
                PokemonImage(imageLink: "\(imglink)")
                Button("normal attack"){
                    let randomint = Int.random(in: 1..<100)
                    if (randomint>=1 && randomint<=25){
                        hpcur1-=6*1.25+Double(xp)
                        hpcur-=6
                    }else if(randomint>=26 && randomint<=50){
                        hpcur1 -= 6*1.5+Double(xp)
                        hpcur-=6*1.25
                    }else if(randomint>=51 && randomint<=75){
                        hpcur1-=6*1.75+Double(xp)
                        hpcur-=6*1.5
                    }
                    else if(randomint>=76 && randomint<=99){
                        hpcur1-=6*2+Double(xp)
                        hpcur-=6*1.75
                    }
                }.padding(50)
                .border(Color.gray)
                .onTapGesture{
                    self.poke = imglink
                }
            }

            VStack(alignment: .leading){
                
                AsyncImage(url: URL(string: imagemenem))
                ProgressView("hp \(Int(hpcur1)) / \(Int(hpmax1))", value: hpcur1, total: hpmax1)
                Spacer()
                Button("special attack"){
                    let randomint1 = Int.random(in: 1..<100)
                    if (randomint1>=1 && randomint1<=5){
                        hpcur1-=15*1.25+Double(xp)
                        hpcur-=6
                    }else if(randomint1>=6 && randomint1<=10){
                        hpcur1 -= 15*1.5+Double(xp)
                        hpcur-=6*1.25
                    }else if(randomint1>=11 && randomint1<=25){
                        hpcur1-=15*1.75+Double(xp)
                        hpcur-=6*1.5
                    }
                    else if(randomint1>=26 && randomint1<=50){
                        hpcur1-=15*2+Double(xp)
                        hpcur-=6*1.75
                    }
                    else{
                        hpcur-=6
                    }
                }.padding(50)
                .border(Color.gray)
            
            }
    }
}
}

struct PokebattleVIew_Previews: PreviewProvider {
    static var previews: some View {
        PokebattleVIew()
    }
}

