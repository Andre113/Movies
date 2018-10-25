//
//  NSObject+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension NSObject {
    /**
     Returns class name from an instance
     */
    var className: String {
        return String(describing: type(of: self))
    }
    
    /**
     Returns class name from a class
     */
    class var className: String {
        return String(describing: self)
    }
}
