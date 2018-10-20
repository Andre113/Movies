//
//  Genre.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

/**
 Model for Genre
 */
struct Genre: Codable {
    let id: Int
    let name: String
}

/**
 Model for decoding Genres list from TMDB API
 */
struct GenreListDecodable: Codable {
    let list: [Genre]
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        list = try map.decode([Genre].self, forKey: .list)
    }
    
    private enum CodingKeys: String, CodingKey {
        case list = "genres"
    }
}
