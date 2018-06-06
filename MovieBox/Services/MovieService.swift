//
//  MovieService.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class MovieService {
    
    func getPopularMovies(page: Int, success: @escaping ([Movie]) -> Void, failure: @escaping (_ error: ServiceError) -> Void) {
        
        let apiUrl = AppEnvironment.ServiceApi.popularMovies.value
        let parameters = ["api_key": AppEnvironment.apiKey.value,
                          "page": page] as [String : Any]

        ServiceManager.shared.request(url: apiUrl, method: .get, queryParameters: parameters, success: { result in
            let response = try! JSONDecoder().decode(PopularMovie.self, from: result)
            success(response.results)
        }, failure: { fail in
            failure(ServiceError(code: fail.code))
        })
    }
    
    func getMovieDetail(id: Int, success: @escaping (Movie) -> Void, failure: @escaping (_ error: ServiceError) -> Void) {
        
        let apiUrl = AppEnvironment.ServiceApi.detailMovie(movieId: id).value
        let parameters = ["api_key": AppEnvironment.apiKey.value] as [String : Any]
        
        ServiceManager.shared.request(url: apiUrl, method: .get, queryParameters: parameters, success: { result in
            let response = try! JSONDecoder().decode(Movie.self, from: result)
            success(response)
        }, failure: { fail in
            failure(ServiceError(code: fail.code))
        })
    }
}
