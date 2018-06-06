//
//  Genre.swift
//  MovieBox
//
//  Created by Rafael Souza on 06/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

struct Genre: Codable {
    
    let id: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
    }
}
