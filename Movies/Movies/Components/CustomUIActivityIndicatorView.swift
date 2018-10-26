//
//  CustomUIActivityIndicatorView.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/24/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class CustomUIActivityIndicatorView: UIActivityIndicatorView {
    struct Constants {
        static let tag = 999
    }
    
    init() {
        super.init(style: UIActivityIndicatorView.Style.whiteLarge)
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        color = UIColor.white
        hidesWhenStopped = true
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
