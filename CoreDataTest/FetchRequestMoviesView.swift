    //
    //  FetchRequestMoviesView.swift
    //  CoreDataTest
    //
    //  Created by Jacek Kosiński G on 03/05/2023.
    //

import SwiftUI

struct FetchRequestMoviesView: View {
    @FetchRequest(fetchRequest: Movie.moviesByReleaseDate) var movies: FetchedResults<Movie>
    
    var body: some View {
        NavigationStack{
            VStack{
                List(movies) { movie in
                    NavigationLink(destination:{
                        VStack{
                            Section("Movie"){
                                Text("**Title:** \(movie.title ?? "--")")
                                    .foregroundStyle(.primary)
                            }
                            Section("Cast") {
                                List(Array(movie.cast as? Set<Actor> ?? Set()), id: \.self ){ actor in
                                    Text(actor.name ?? "")
                                }
                            }
                        }
                    }, label: {
                        Text(movie.title ?? "")
                    })
                }
            }
        }
    }
}

struct FetchRequestMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FetchRequestMoviesView()
    }
}
