//
//  CompetitionName.swift
//  Football Fixture
//
//  Created by user on 10/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
struct CompetitionResults:Codable {
    let count: Int?
    let results: [competition]?
    
    enum CodingKeys: String, CodingKey{
        case results = "competitions"
        case count
        
    }
}
