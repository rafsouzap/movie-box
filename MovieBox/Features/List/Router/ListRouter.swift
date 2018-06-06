//
//  ListRouter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

final class ListRouter {
    
    func present(at navigation: NavigationViewController) {
        
        let controller = ListTableViewController()
        let presenter = ListPresenter(view: controller)
        controller.presenter = presenter
        
        navigation.setViewControllers([controller], animated: true)
    }
}
