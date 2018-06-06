//
//  ServiceTest.swift
//  MovieBoxTests
//
//  Created by Rafael Souza on 06/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import XCTest
@testable import MovieBox

class ServiceTest: XCTestCase {
    
    let service = MovieService()
    
    func testGetPopularMovies_WithPageZero_ReturnsError() {
        let exp = self.expectation(description: "Wait for getPopularMovies completion")
        var error: ServiceError?
        var movies: [Movie]?
        
        service.getPopularMovies(page: 0, success: { result in
            movies = result
            exp.fulfill()
        }, failure: { fail in
            error = fail
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(movies)
        XCTAssertNotNil(error)
    }
    
    func testGetPopularMovies_WithFirstPage_ReturnsTwentyMovies() {
        let exp = self.expectation(description: "Wait for getPopularMovies completion")
        var error: ServiceError?
        var movies: [Movie]?
        
        service.getPopularMovies(page: 1, success: { result in
            movies = result
            exp.fulfill()
        }, failure: { fail in
            error = fail
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(error)
        XCTAssertNotNil(movies)
        XCTAssertEqual(movies!.count, 20)
    }

    func testGetPopularMovies_WithAboveMaxPage_ReturnsEmpty() {
        let exp = self.expectation(description: "Wait for getPopularMovies completion")
        var error: ServiceError?
        var movies: [Movie]?
        
        service.getPopularMovies(page: 1000, success: { result in
            movies = result
            exp.fulfill()
        }, failure: { fail in
            error = fail
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(error)
        XCTAssertNotNil(movies)
        XCTAssertEqual(movies!.count, 0)
    }
    
    func testGetMovieDetail_WithInvalidId_ReturnsError() {
        let exp = self.expectation(description: "Wait for getMovieDetail completion")
        var error: ServiceError?
        var movie: Movie?

        service.getMovieDetail(id: 0, success: { result in
            movie = result
            exp.fulfill()
        }, failure: { fail in
            error = fail
            exp.fulfill()
        })

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(movie)
        XCTAssertNotNil(error)
    }
    
    func testGetMovieDetail_WithValidId_ReturnsMovie() {
        let exp = self.expectation(description: "Wait for getMovieDetail completion")
        let movieId = 383498
        var error: ServiceError?
        var movie: Movie?

        service.getMovieDetail(id: movieId, success: { result in
            movie = result
            exp.fulfill()
        }, failure: { fail in
            error = fail
            exp.fulfill()
        })

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(error)
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie!.id, movieId)
    }
}
