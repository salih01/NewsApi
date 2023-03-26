//
//  CoreDataStack.swift
//  NewsApi
//
//  Created by Salih on 25.03.2023.
//

import Foundation
import CoreData

class CoreDataStack {
    
    //singleton
    static let shared = CoreDataStack()
    
    private init(){}
    
    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NewsApi")
        container.loadPersistentStores { StoreDescription, error in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
                
            }
        }
        return container
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
}
