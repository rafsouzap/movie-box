//
//  MovieViewData.swift
//  MovieBox
//
//  Created by Rafael Souza on 06/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

struct MovieViewData {
    
    let title: String
    let overview: String
    let votes: String
    let imageUrl: String
    let id: Int
    
    init(with movie: Movie) {
        self.title = movie.title
        self.overview = movie.overview
        self.votes = "\(movie.voteCount)"
        self.imageUrl = movie.posterPath ?? ""
        self.id = movie.id
    }
}
