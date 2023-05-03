//
//  ActorDetailView.swift
//  CoreDataTest
//
//  Created by Jacek Kosiński G on 03/05/2023.
//

import SwiftUI

struct ActorDetailView: View {
    @ObservedObject var actor: Actor
    var body: some View {
        Form{
            VStack{
                Section("Actor"){
                    Text("**Actor** \(actor.name ?? "")")
                    
                }
                NavigationStack{
                Section("Movies") {
                  
                        List(Array(actor.movies as? Set<Movie> ?? Set()), id: \.self ){ movie in
                            Text(movie.title ?? "")
                        }
                    }
                    
                    Section("Characters") {
                        
                        List(Array(actor.characters as? Set<Character> ?? Set()), id: \.self ){ charcter in
                            Text(charcter.name ?? "")
                        }
                    }
                }
                
                
        }
        }
       
    }
}

//struct ActorDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActorDetailView()
//    }
//}
