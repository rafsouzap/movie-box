//
//  PopularMovie.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

struct PopularMovie: Codable {
    
    let results: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
}
