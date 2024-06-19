//
//  CoreDataManager.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        container = NSPersistentContainer(name: "ProSoccer")
        container.loadPersistentStores { descption, error in
            if let error = error{
                print("Error looading core data\(error)")
            }
        }
        context = container.viewContext
        
    }
    
    func save(){
        do {
            try context.save()
        }catch{
            print("Save data erroe \(error.localizedDescription)")
        }
    }
}
