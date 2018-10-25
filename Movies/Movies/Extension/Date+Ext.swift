//
//  Date+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension Date {
    /**
     Returns a Date from a String with the passed format
     */
    static func dateWith(format: String, from string: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        
        return df.date(from: string)
    }
    
    /**
     Returns a String with the passed format
     */
    func stringFromDateWith(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        
        return df.string(from: self)
    }
}
