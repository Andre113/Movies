//
//  UIView+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/24/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UIView {
    func setAsCardView() {
        let radius: CGFloat = 2
        layer.cornerRadius = radius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3);
        layer.shadowOpacity = 0.5
        layer.shadowPath = shadowPath.cgPath
    }
}
