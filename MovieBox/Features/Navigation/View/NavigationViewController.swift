//
//  NavigationViewController.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class NavigationViewController: UINavigationController {

    var presenter: NavigationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.setupLayout()
    }
}

// MARK: - Private methods

extension NavigationViewController {
    
    fileprivate func setupLayout() {
        
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = .customRed
        self.navigationBar.isTranslucent = false
        self.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "BackButton")
        self.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "BackButton")

        let titleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                               NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        
        self.navigationBar.titleTextAttributes = titleAttributes
        
        let buttonAttributes = [NSAttributedStringKey.foregroundColor: UIColor.clear,
                                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 0.1, weight: .medium)]
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationViewController.self]).setTitleTextAttributes(buttonAttributes, for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationViewController.self]).setTitleTextAttributes(buttonAttributes, for: .highlighted)
    }
}
