//
//  MovieDetailViewData.swift
//  MovieBox
//
//  Created by Rafael Souza on 06/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct MovieDetailViewData {
    
    let title: String
    let overview: String
    let score: String
    let posterImageUrl: String
    let backdropImageUrl: String
    let releaseDate: String
    let genres: String
    
    init(with movie: Movie) {
        self.title = movie.title
        self.overview = movie.overview
        self.score = "\(movie.voteAverage)"
        self.posterImageUrl = movie.posterPath ?? ""
        self.backdropImageUrl = movie.backdropPath ?? ""
        self.releaseDate = movie.releaseDate
        
        let genresArray = movie.genres.compactMap { $0.name }
        self.genres = genresArray.joined(separator: ", ")
    }
}
