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
    
    func get(index: Int) -> Movie {
        return self.moviesList[index]
    }
    
    func update(index: Int, movie: Movie) {
        self.moviesList[index] = movie
    }
    
    func remove(index: Int) {
        self.moviesList.remove(at: index)
    }
    
    func moveItem(from: Int, to: Int) {
        let movieToMove = self.moviesList[from]
        self.moviesList.remove(at: from)
        self.moviesList.insert(movieToMove, at: to)
    }
    
    func getMovies() -> Array<Movie> {
        return self.moviesList
    }
}
