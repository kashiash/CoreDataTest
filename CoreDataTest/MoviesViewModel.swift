//
//  MoviesViewModel.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import Foundation
import CoreData

class MoviesViewModel: NSObject,ObservableObject {
    @Published var movies = [Movie]()
    private let fetchedResultsController: NSFetchedResultsController<Movie>
    
    init(storageProvider: StorageProvider){
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Movie.popularity,ascending: false)]
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                                   managedObjectContext: storageProvider.persistentContainer.viewContext,
                                                                   sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        try! fetchedResultsController.performFetch()
        movies = fetchedResultsController.fetchedObjects ?? []
    }
}

extension MoviesViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        movies = controller.fetchedObjects as? [Movie] ?? []
    }
}
