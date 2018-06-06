//
//  NavigationRouter.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class NavigationRouter {
    
    class func present(at window: UIWindow?) {
        
        let controller = NavigationViewController()
        let presenter = NavigationPresenter(view: controller)
        controller.presenter = presenter
        
        window?.rootViewController = controller
    }
}

