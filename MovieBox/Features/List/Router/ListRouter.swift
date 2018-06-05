//
//  ListRouter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

final class ListRouter {
    
    func show(at navigation: NavigationViewController) {
        
        let controller = ListTableViewController()
        let presenter = ListPresenter(view: controller, router: self)
        controller.presenter = presenter
        navigation.show(controller, sender: nil)
    }
}
