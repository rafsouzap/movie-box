//
//  AppEnvironment.swift
//  MovieBox
//
//  Created by Rafael Souza on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

enum AppEnvironment {
    
    enum ServiceApi {
        case popularMovies
        case detailMovie(movieId: Int)
        
        var value: String {
            switch self {
            case .popularMovies:
                return AppEnvironment.apiBaseUrl.value.appending("movie/popular")
            case .detailMovie(let movieId):
                return AppEnvironment.apiBaseUrl.value.appending("movie/\(movieId)")
            }
        }
    }
    
    case apiBaseUrl
    case apiKey
    case imageBaseUrl(width: Int)
    
    var value: String {
        switch self {
        case .apiBaseUrl: return "https://api.themoviedb.org/3/"
        case .apiKey: return "ed63bd3f7b8971c6e99b77235fa44110"
        case .imageBaseUrl(let width): return "https://image.tmdb.org/t/p/w\(width)/"
        }
    }
}
