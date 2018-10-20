//
//  MovieNetwork.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol MovieService {
    
}

enum MovieServiceError: Equatable, Error {
    case CannotFetch(String)
}

struct MovieNetwork: MovieService {
    
}
