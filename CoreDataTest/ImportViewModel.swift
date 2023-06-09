//
//  ImportViewModel.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import SwiftUI

import Combine

struct ImportView: View {
    let viewModel: ImportViewModel
    
    var body: some View {
        Button("Run Importer") {
            viewModel.runImport()
        }
    }
}

class ImportViewModel {
    let storageProvider: StorageProvider
    let importer = MovieDbImporter()
    var cancellables = Set<AnyCancellable>()
    
    init(storageProvider: StorageProvider) {
        self.storageProvider = storageProvider
    }
    
    func runImport() {
        importer.importNextPage(in: storageProvider.persistentContainer.viewContext)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { _ in
                print("done")
            })
            .store(in: &cancellables)
    }
}
