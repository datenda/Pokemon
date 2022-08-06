//
//  PokemonFinalApp.swift
//  Shared
//
//  Created by bro on 27/07/2022.
//

import SwiftUI

@main
struct PokemonFinalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
