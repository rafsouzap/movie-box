//
//  ListPresenter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class ListPresenter {
    
    fileprivate unowned var view: ListViewProtocol
    fileprivate let service: MovieService
    fileprivate(set) var movies: [MovieViewData] = []
    fileprivate var pageIndex = 1
    
    init(view: ListViewProtocol) {
        self.view = view
        self.service = MovieService()
    }
}

// MARK: - Public methods

extension ListPresenter {

    func loadPopularMovies() {
        self.loadMovies(firstLoad: true)
    }
    
    func loadMorePopularMovies() {
        self.pageIndex += 1
        self.loadMovies(firstLoad: false, page: self.pageIndex)
    }
    
    func showMovieDetail(by index: Int) {
        let movie = self.movies[index]
        let navigation = (UIApplication.shared.delegate as? AppDelegate)?.navigation?.presenter
        navigation?.go(to: .detail, with: movie.id)
    }
}

// MARK: - Private methods

extension ListPresenter {
    
    fileprivate func loadMovies(firstLoad: Bool, page: Int = 1) {
        
        self.view.showLoading()
        self.service.getPopularMovies(page: page, success: { result in
            
            let viewData = result.compactMap { MovieViewData(with: $0) }
            
            if firstLoad {
                self.movies = viewData
            } else {
                self.movies.append(contentsOf: viewData)
            }
            self.showView()
        }, failure: { fail in
            self.requestError(description: fail.description)
        })
    }
    
    fileprivate func showView() {
        self.view.hideLoading()
        self.view.reloadTableView()
    }
    
    fileprivate func requestError(description: String) {
        self.view.hideLoading()
        self.view.showAlertError(title: "Erro", message: description, buttonTitle: "OK")
    }
}
