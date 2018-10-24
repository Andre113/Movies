//
//  GenresListview.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol GenresListview: NSObjectProtocol {
    func setupGenres(genres: [Genre])
    func showError(error: Error)
}
