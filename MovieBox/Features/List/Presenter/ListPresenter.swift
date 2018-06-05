//
//  ListPresenter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class ListPresenter {
    
    fileprivate unowned var view: ListViewProtocol
    fileprivate var router: ListRouter
    
    init(view: ListViewProtocol, router: ListRouter) {
        self.view = view
        self.router = router
    }
}
