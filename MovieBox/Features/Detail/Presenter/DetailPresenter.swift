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
    
    init(view: DetailViewProtocol) {
        self.view = view
    }
}
