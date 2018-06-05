//
//  NSObjectExtension.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

protocol Identifier { }

extension Identifier where Self: NSObject {
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier { }
