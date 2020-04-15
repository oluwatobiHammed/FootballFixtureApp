//
//  MatchResults.swift
//  Football Fixture
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct MatchResults: Codable {
    let results: [Match]?
    
    enum CodingKeys: String, CodingKey{
        case results = "matches"
        
        
    }
}
