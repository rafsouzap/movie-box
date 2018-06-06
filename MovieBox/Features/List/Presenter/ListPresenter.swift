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
    //fileprivate(set) var products: [ProductView] = []
    fileprivate(set) var movies: [Movie] = []
    
    init(view: ListViewProtocol) {
        self.view = view
        self.service = MovieService()
    }
}

// MARK: - Public methods

extension ListPresenter {

    func loadPopularMovies(page: Int = 1) {
        
        self.view.showLoading()
        self.service.getPopularMovies(page: page, success: { result in
            self.movies.append(contentsOf: result)
            self.showView()
        }, failure: { fail in
            self.requestError(description: fail.description)
        })
    }
    
    func showMovieDetail(by index: Int) {
        let navigation = (UIApplication.shared.delegate as? AppDelegate)?.navigation?.presenter
        navigation?.go(to: .detail)
    }

}

// MARK: - Private methods

extension ListPresenter {
    
    fileprivate func showView() {
        self.view.hideLoading()
        self.view.reloadTableView()
    }
    
    fileprivate func requestError(description: String) {
        self.view.hideLoading()
        self.view.showAlertError(title: "Erro", message: description, buttonTitle: "OK")
    }
}
