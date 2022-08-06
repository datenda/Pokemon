//
//  CoreDataManager.swift
//  PokemonFinal
//
//  Created by bro on 01/08/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    @NSManaged var pokestats: [NSNumber]
    @NSManaged var poketypes: [String]
    
    init(){
        persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores{(description, error) in
            if let error = error {
                fatalError("Core Data failed \(error.localizedDescription)")
            }
        }
    }
    
    func getPoke() -> [Poke] {
        let fetchRequest: NSFetchRequest<Poke> = Poke.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
            
        }
    
    func savePoke (pokename: String, hp: Int, defense: Int, poketypes: String){
        
        let poke = Poke(context: persistentContainer.viewContext)
        
        do{
            return try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save pokemon \(error)")
        }
    }
}
