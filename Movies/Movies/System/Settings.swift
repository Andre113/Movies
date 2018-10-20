//
//  Settings.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

struct Settings {
    struct Constants {
        static let settings = "AppSettings"
        static let apiURL = "API_URL"
        static let apiKey = "API_KEY"
        static let apiImageURL = "API_IMAGE_URL"
    }
    
    static let shared = Settings()
    
    let apiURL: String
    let apiKey: String
    let apiImageURL: String
    
    private init() {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")!
        let plist = NSDictionary(contentsOfFile: path) as! [AnyHashable: Any]
        
        let settings = plist[Constants.settings] as! [AnyHashable: Any]
        
        apiURL = settings[Constants.apiURL] as! String
        apiKey = settings[Constants.apiKey] as! String
        apiImageURL = settings[Constants.apiImageURL] as! String
    }
}
