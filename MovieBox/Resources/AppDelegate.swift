//
//  AppDelegate.swift
//  MovieBox
//
//  Created by Rafael Souza on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var navigation: NavigationViewController? {
        return self.window?.rootViewController as? NavigationViewController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        NavigationRouter.present(at: self.window)
        
        self.navigation?.presenter?.go(to: .list)
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
