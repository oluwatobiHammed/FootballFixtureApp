//
//  Standings.swift
//  Football Fixture
//
//  Created by user on 13/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct StandingsResult: Codable, Equatable {
    let standings: [standings]?
    let competition: competitionId?
}
struct competitionId: Codable, Equatable {
    let id: Int
    
}
