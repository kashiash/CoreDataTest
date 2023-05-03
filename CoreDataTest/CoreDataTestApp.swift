//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let storageProvider = StorageProvider()
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: MoviesViewModel(storageProvider:storageProvider))
                .tabItem{
                    Image(systemName: "movie")
                    Text("Filmy")
                }
            
            FetchRequestMoviesView()
                .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
                .tabItem {
                    Image(systemName: "film")
                    Text("Fetch request")
                }
        }
    }
}
