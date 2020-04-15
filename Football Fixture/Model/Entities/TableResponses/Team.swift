//
//  Team.swift
//  Football Fixture
//
//  Created by user on 13/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
struct Team: Codable, Equatable {
    let name: String
    let crestUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case crestUrl
    }

}
