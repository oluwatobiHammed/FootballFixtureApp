//
//  Teams.swift
//  Football Fixture
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
struct awayTeam: Codable{
    let name: String
    let lineup: [Lineup]?
}
struct homeTeam: Codable {
    let name: String
    let lineup: [Lineup]?
}
