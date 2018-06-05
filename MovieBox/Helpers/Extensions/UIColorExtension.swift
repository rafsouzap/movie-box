//
//  UIColorExtension.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

// MARK: - Custom initializers

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red value")
        assert(green >= 0 && green <= 255, "Invalid green value")
        assert(blue >= 0 && blue <= 255, "Invalid blue value")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexadecimal: Int) {
        self.init(red:(hexadecimal >> 16) & 0xff, green:(hexadecimal >> 8) & 0xff, blue:hexadecimal & 0xff)
    }
}

// MARK: - Custom colors

extension UIColor {
    
    static let lightenGray = UIColor(hexadecimal: 0xFCFCFC)
    static let pink = UIColor(hexadecimal: 0xEA4C89)
    static let blueLink = UIColor(hexadecimal: 0x4A90E2)
    static let charcoal = UIColor(hexadecimal: 0x4A4A4A)
    static let slate = UIColor(hexadecimal: 0x9DA3A5)
}
