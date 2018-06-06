//
//  DetailRouter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

final class DetailRouter {
    
    func show(at navigation: NavigationViewController) {
        
        let controller = DetailViewController()
        let presenter = DetailPresenter(view: controller)
        controller.presenter = presenter
        
        navigation.show(controller, sender: nil)
    }
}

