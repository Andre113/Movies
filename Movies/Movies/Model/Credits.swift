//
//  Credits.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

/**
 Model for Credits
 */
struct Credits: Codable {
    let id: Int
    let cast: [CastMember]
    let crew: [CrewMember]
}
