//
//  StorageContainer.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import Foundation
import CoreData

public class PersistentContainer: NSPersistentContainer {}


public class StorageProvider {
    
    public let persistentContainer: PersistentContainer
    
    public init() {
        persistentContainer = PersistentContainer(name: "CoreDataTest")
        
        persistentContainer.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        })
        
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
}
