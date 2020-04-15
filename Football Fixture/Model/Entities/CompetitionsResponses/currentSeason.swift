//
//  currentSeason.swift
//  Football Fixture
//
//  Created by user on 09/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct currentSeason: Codable, Equatable {
        let season: String?
        let currentMatchday: Int?
    
    enum CodingKeys: String, CodingKey{
        case season = "startDate"
        case currentMatchday
        
    }
}
