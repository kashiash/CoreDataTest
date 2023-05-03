//
//  FetchRequestMoviesView.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import SwiftUI

struct FetchRequestMoviesView: View {
    @FetchRequest(fetchRequest: Movie.moviesByReleaseDate) var movies: FetchedResults<Movie>
    
    var body: some View { List(movies) { movie in
        
        Text(movie.title ?? "--")
    }
    } 
}

struct FetchRequestMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FetchRequestMoviesView()
    }
}
