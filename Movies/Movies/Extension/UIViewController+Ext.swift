//
//  UIViewController+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UIViewController {
    //    MARK: - Alert
    
    /**
     Show alert with message, title for close button and optional callback
     */
    func showAlert(message: String, closeTitle: String = "Ok", callback: ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: "Movies", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: closeTitle, style: .default, handler: callback))
        
        present(alertController, animated: true, completion: nil)
    }
}
