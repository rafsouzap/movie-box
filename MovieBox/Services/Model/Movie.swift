//
//  Movie.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
    private enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Movie: Codable {
    
    let posterPath: String
    let overview: String
    let releaseDate: String
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.posterPath = try values.decode(String.self, forKey: .posterPath)
        self.overview = try values.decode(String.self, forKey: .overview)
        self.releaseDate = try values.decode(String.self, forKey: .releaseDate)
        self.id = try values.decode(Int.self, forKey: .id)
        self.originalTitle = try values.decode(String.self, forKey: .originalTitle)
        self.originalLanguage = try values.decode(String.self, forKey: .originalLanguage)
        self.title = try values.decode(String.self, forKey: .title)
        self.backdropPath = try values.decode(String.self, forKey: .backdropPath)
        self.voteCount = try values.decode(Int.self, forKey: .voteCount)
    }
}
