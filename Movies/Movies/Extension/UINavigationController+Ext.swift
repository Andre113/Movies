//
//  UINavigationController+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UINavigationController {
    static func setDefaultLayout() {
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = UIColor.Venomous.purple
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func presentInNavigation(vc: UIViewController, animated: Bool = true, completion: (() -> Void)?) {
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: animated, completion: completion)
    }
}
