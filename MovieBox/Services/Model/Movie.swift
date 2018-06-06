//
//  Movie.swift
//  MovieBox
//
//  Created by Rafael Souza on 06/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

struct Movie: Codable {
    
    let overview: String
    let releaseDate: String
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let voteCount: Int
    let voteAverage: Double
    var genres: [Genre] = []
    
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
        case voteAverage = "vote_average"
        case genres
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.overview = try values.decode(String.self, forKey: .overview)
        self.releaseDate = try values.decode(String.self, forKey: .releaseDate)
        self.id = try values.decode(Int.self, forKey: .id)
        self.originalTitle = try values.decode(String.self, forKey: .originalTitle)
        self.originalLanguage = try values.decode(String.self, forKey: .originalLanguage)
        self.title = try values.decode(String.self, forKey: .title)
        self.posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.voteCount = try values.decode(Int.self, forKey: .voteCount)
        self.voteAverage = try values.decode(Double.self, forKey: .voteAverage)
        
        if let genres = try? values.decode([Genre].self, forKey: .genres) {
            self.genres.append(contentsOf: genres)
        }
    }
}
