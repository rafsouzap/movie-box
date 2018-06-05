//
//  UIViewExtension.swift
//  MovieBox
//
//  Created by Rafael Souza on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

extension UIView {
    
    func setShadow() {
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
    func setGlow() {
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
