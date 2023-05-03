    //
    //  MovieDetailView.swift
    //  CoreDataTest
    //
    //  Created by Jacek Kosiński G on 03/05/2023.
    //

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var movie: Movie
    var body: some View {
        Form{
            VStack{
                Section("Movie"){
                    Text("**Title:** \(movie.title ?? "--")")
                        .foregroundStyle(.primary)
                }
                Section("Cast") {
                    NavigationStack{
                        List(Array(movie.cast as? Set<Actor> ?? Set()), id: \.self ){ actor in
                            
                            
                            NavigationLink{
                                VStack(alignment: .leading) {
                                    ActorDetailView(actor: actor)
                                }
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(actor.name ?? "--")
                                }
                            }
                            
                            Text(actor.name ?? "")
                        }
                    }
                }
            }
        }
    }
}

    //struct MovieDetailView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        MovieDetailView()
    //    }
    //}
