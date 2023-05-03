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
        List(viewModel.movies) { (movie: Movie) in
            Text(movie.title ?? "--")
        }
    }
}

//struct MoviesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesView()
//    }
//}
