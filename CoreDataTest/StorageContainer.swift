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

public extension StorageProvider {
    var minDate: Date {
        let components = DateComponents(calendar: Calendar.current, year: 1950)
        return components.date ?? Date()
    }
    
    var maxDate: Date {
        let components = DateComponents(calendar: Calendar.current, year: 1990)
        return components.date ?? Date()
    }
    
    var oldMovies: NSFetchRequest<Movie> {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@",
                                        #keyPath(Movie.releaseDate), minDate as NSDate,
                                        #keyPath(Movie.releaseDate), maxDate as NSDate)
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Movie.releaseDate, ascending: false)
        ]
        return request
    }
    
    var charactersByActor: NSFetchRequest<Character> {
        let request: NSFetchRequest<Character> = Character.fetchRequest()
        request.predicate = NSPredicate(format: "%K != %@", #keyPath(Character.actor.name), "")
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Character.actor?.name, ascending: true)
        ]
        request.relationshipKeyPathsForPrefetching = ["actor"]
        request.fetchBatchSize = 20
        return request
    }
}

public extension Movie {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    @objc var releaseYear: String {
        return Movie.formatter.string(from: self.releaseDate ?? Date())
    }
    
    static var moviesByReleaseDate: NSFetchRequest<Movie> {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Movie.releaseDate, ascending: false)
        ]
        return request
    }
}
