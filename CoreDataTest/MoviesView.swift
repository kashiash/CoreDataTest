//
//  MoviesView.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel: MoviesViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                List(viewModel.movies) { (movie: Movie) in
                    NavigationLink{
                        VStack(alignment: .leading) {
                            MovieDetailView(movie: movie)
                        }
                    } label: {
                        VStack(alignment: .leading) {
                            Text(movie.title ?? "--")
                            Text(movie.releaseYear)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
            
    

            
        }
    }
}

//struct MoviesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesView()
//    }
//}
