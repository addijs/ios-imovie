//
//  Movie.swift
//  iMovie
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Movie: NSObject {
    var title: String
    var timesWatched: Int
    var rating: Int
    var isOscarNominated: Bool
        
    init(title: String, timesWatched: Int, rating: Int, isOscarNominated: Bool) {
        self.title = title
        self.timesWatched = timesWatched
        self.rating = rating
        self.isOscarNominated = isOscarNominated
    }
    
    override var description: String {
        return "\(self.title) - Nota: \(self.rating) - Indicado: \(self.isOscarNominated)"
    }
}
