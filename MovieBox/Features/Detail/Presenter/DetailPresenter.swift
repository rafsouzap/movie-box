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
    fileprivate(set) var movie: MovieDetail?
    
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
            // receber e tratar o objeto
            self.showView()
        }, failure: { fail in
            self.requestError(description: fail.description)
        })
    }
}

// MARK: - Private methods

extension DetailPresenter {
    
    fileprivate func showView() {
        self.view.hideLoading()
        self.view.reloadTableView()
    }
    
    fileprivate func requestError(description: String) {
        self.view.hideLoading()
        self.view.showAlertError(title: "Erro", message: description, buttonTitle: "OK")
    }
}
