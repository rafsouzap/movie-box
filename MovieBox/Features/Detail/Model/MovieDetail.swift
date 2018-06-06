//
//  MovieDetail.swift
//  MovieBox
//
//  Created by Rafael Souza on 06/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {

    let backdropPath: String
    let homepage: String
    let id: Int
    let imdbId: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let status: String
    let tagline: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case status
        case tagline
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.backdropPath = try values.decode(String.self, forKey: .backdropPath)
        self.homepage = try values.decode(String.self, forKey: .homepage)
        self.id = try values.decode(Int.self, forKey: .id)
        self.imdbId = try values.decode(String.self, forKey: .imdbId)
        self.originalLanguage = try values.decode(String.self, forKey: .originalLanguage)
        self.originalTitle = try values.decode(String.self, forKey: .originalTitle)
        self.overview = try values.decode(String.self, forKey: .overview)
        self.posterPath = try values.decode(String.self, forKey: .posterPath)
        self.releaseDate = try values.decode(String.self, forKey: .releaseDate)
        self.status = try values.decode(String.self, forKey: .status)
        self.tagline = try values.decode(String.self, forKey: .tagline)
        self.title = try values.decode(String.self, forKey: .title)
        self.voteAverage = try values.decode(Double.self, forKey: .voteAverage)
        self.voteCount = try values.decode(Int.self, forKey: .voteCount)
    }
}
