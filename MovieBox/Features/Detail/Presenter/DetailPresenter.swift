//
//  DetailPresenter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class DetailPresenter {
    
    fileprivate unowned var view: DetailViewProtocol
    fileprivate let service: MovieService
    fileprivate(set) var movie: MovieDetailViewData?
    
    init(view: DetailViewProtocol) {
        self.view = view
        self.service = MovieService()
    }
}

// MARK: - Public methods

extension DetailPresenter {
    
    func loadMovieDetail(with id: Int) {
        
        self.view.showLoading()
        self.service.getMovieDetail(id: id, success: { result in
            let viewData = MovieDetailViewData(with: result)
            self.showView(with: viewData)
        }, failure: { fail in
            self.requestError(description: fail.description)
        })
    }
}

// MARK: - Private methods

extension DetailPresenter {
    
    fileprivate func showView(with movie: MovieDetailViewData) {
        self.view.hideLoading()
        self.view.setMovieDetail(with: movie)
    }
    
    fileprivate func requestError(description: String) {
        self.view.hideLoading()
        self.view.showAlertError(title: "Erro", message: description, buttonTitle: "OK")
    }
}
