//
//  CastMember.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

/**
 Model for CastMember
 */
struct CastMember: Codable {
    let id: Int
    let name: String?
    let character: String?
    let order: Int?
    let profilePath: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "cast_id"
        case name
        case character
        case order
        case profilePath = "profile_path"
    }
}
