//
//  NSNumber+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/25/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension NSNumber {
    func getCleanNumber() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        let cleanNum = formatter.string(from: self) ?? "0"
        return cleanNum
    }
}
