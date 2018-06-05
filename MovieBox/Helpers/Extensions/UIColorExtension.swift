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
    
    static let customRed = UIColor(hexadecimal: 0xBC002D)
    static let customBlue = UIColor(hexadecimal: 0x3A8BBB)
    static let customDarkGray = UIColor(hexadecimal: 0x444444)
    static let customGray = UIColor(hexadecimal: 0x9DA3A5)
    static let customLightGray = UIColor(hexadecimal: 0xFCFCFC)
    static let customGreen = UIColor(hexadecimal: 0x66CC99)
}
