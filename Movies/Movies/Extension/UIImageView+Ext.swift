//
//  UIImageView+Ext.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill, callback: @escaping(Bool) -> Void) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                //                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    callback(false)
                    return
            }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                callback(true)
            }
        }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill, callback: @escaping(Bool) -> Void) {
        guard let url = URL(string: link) else {
            callback(false)
            return
        }
        
        downloadedFrom(url: url, contentMode: mode){ success in
            callback(success)
        }
    }
}
