//
//  Match.swift
//  Football Fixture
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct Match: Codable {
    let status: String?
    let season: season?
    let homeTeam: homeTeam?
    let awayTeam: awayTeam?
    let score: Score?
    let lastUpdated: String
   
    
    
    enum CodingKeys: String, CodingKey {
        case season
        case awayTeam
        case homeTeam
        case score
        case status
        case lastUpdated
    }
    
    
}
