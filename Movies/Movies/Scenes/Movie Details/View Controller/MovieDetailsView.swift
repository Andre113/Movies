//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol MovieDetailsView: NSObjectProtocol {
    func setupInformation(movie: Movie, credits: Credits)
}
