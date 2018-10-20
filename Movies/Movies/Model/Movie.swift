//
//  Movie.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

/**
 Enum with Poster Quality values from TMDB API
 */
enum PosterPathQuality: String {
    case High = "original"
    case Medium = "w342"
    case Low = "w92"
}

/**
 Model for Movie
 */
struct Movie: Decodable {
    let id: Int
    let logoPath: String?
    let title: String?
    let rating: Float?
    let releaseDate: Date?
    let overview: String?
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        id = try map.decode(Int.self, forKey: .id)
        logoPath = try map.decode(String?.self, forKey: .logoPath)
        title = try map.decode(String?.self, forKey: .title)
        rating = try map.decode(Float?.self, forKey: .rating)
        overview = try map.decode(String?.self, forKey: .overview)

        if let releaseDateString = try map.decode(String?.self, forKey: .releaseDateString) {
            releaseDate = Date.dateWith(format: "yyyy-MM-dd", from: releaseDateString)
        } else {
            releaseDate = nil
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "poster_path"
        case title = "title"
        case rating = "vote_average"
        case releaseDateString = "release_date"
        case overview = "overview"
    }
    
    /**
     Returns url for logo
     */
    func logoPathForQuality(quality: PosterPathQuality) -> String? {
        if let logoPath = logoPath {
            let baseImageUrl = Settings.shared.apiImageURL
            
            return baseImageUrl + quality.rawValue + logoPath
        }
        
        return nil
    }
}

/**
 Model for decoding Movies list from TMDB API
 */
struct MovieListDecodable: Decodable {
    let list: [Movie]
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        list = try map.decode([Movie].self, forKey: .list)
    }
    
    private enum CodingKeys: String, CodingKey {
        case list = "results"
    }
}
