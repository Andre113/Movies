//
//  UIView+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/24/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UIView {
    /**
     Set cardView appearance
     */
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
    
    //    MARK: - ActivityView
    
    /**
     Insert an UIActivityIndicatorView on the view
     */
    func startLoading(isUserInteractionEnabled: Bool = false){
        self.isUserInteractionEnabled = isUserInteractionEnabled
        
        //View with black transparent background
        let recipientView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        recipientView.tag = CustomUIActivityIndicatorView.Constants.tag
        recipientView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        recipientView.layer.cornerRadius = 5.0
        
        //UIActivityIndicatorView
        let loadingView = CustomUIActivityIndicatorView()
        loadingView.center = recipientView.center
        
        recipientView.addSubview(loadingView)
        addSubview(recipientView)
        
        let centerX = UIScreen.main.bounds.size.width/2
        let centerY = UIScreen.main.bounds.size.height/2
        recipientView.center = CGPoint(x: centerX, y: centerY)
        
        loadingView.startAnimating()
        bringSubviewToFront(loadingView)
    }
    
    /**
     Remove UIActivityIndicatorView from the screen and enables userInteraction
     */
    func finishLoading(){
        isUserInteractionEnabled = true
        
        guard let recipientView = viewWithTag(CustomUIActivityIndicatorView.Constants.tag) else {
            return
        }
        
        recipientView.removeFromSuperview()
    }
    
    func centerLoadingView(){
        guard let recipientView = viewWithTag(CustomUIActivityIndicatorView.Constants.tag) else {
            return
        }
        
        recipientView.center = center
    }
}
