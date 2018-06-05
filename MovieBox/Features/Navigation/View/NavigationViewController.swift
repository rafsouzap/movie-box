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
        self.setupImageNavigationBar()
    }
}

// MARK: - Private methods

extension NavigationViewController {
    
    fileprivate func setupLayout() {
        
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = .pink
        self.navigationBar.isTranslucent = false
        
        self.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "BackIcon")
        self.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "BackIcon")
        
        let buttonAttributes = [NSAttributedStringKey.foregroundColor: UIColor.clear,
                                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 0.1, weight: .medium)]
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationViewController.self]).setTitleTextAttributes(buttonAttributes, for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationViewController.self]).setTitleTextAttributes(buttonAttributes, for: .highlighted)
    }
    
    fileprivate func setupImageNavigationBar() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "DribbbleLogo"))
        imageView.frame = CGRect(x: 0, y: 0, width: (imageView.image?.size.width)!, height: (imageView.image?.size.height)!)
        imageView.contentMode = .scaleAspectFit
        
        self.topViewController?.navigationItem.titleView = imageView
    }
}
