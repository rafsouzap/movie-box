//
//  NavigationPresenter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class NavigationPresenter {

    fileprivate let appDelegate = UIApplication.shared.delegate as! AppDelegate
    fileprivate unowned let view: NavigationViewController
    
    init(view: NavigationViewController) {
        self.view = view
    }
}

// MARK: - Public methods

extension NavigationPresenter {
    
    func go(to route: Routes, with item: Any? = nil) {
        
        switch route {
        case .list:
            ListRouter().present(at: self.view)
            
        case .detail:
            DetailRouter().show(at: self.view)
        }
    }
}
