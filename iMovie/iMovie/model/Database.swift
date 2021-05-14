//
//  Database.swift
//  iMovie
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Database {
    private var moviesList: Array<Movie>
    
    init() {
        self.moviesList = Array<Movie>()
    }
    
    func add(movie: Movie) {
        self.moviesList.append(movie)
    }
    
    func count() -> Int {
        return self.moviesList.count
    }
    
    func getMovies() -> Array<Movie> {
        return self.moviesList
    }
}
