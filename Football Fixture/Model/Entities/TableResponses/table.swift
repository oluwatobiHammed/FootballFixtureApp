//
//  table.swift
//  Football Fixture
//
//  Created by user on 24/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
struct table: Codable, Equatable {
    let position: Int?
    let team: Team?
    let playedGames: Int?
    let points: Int?
    let goalDifference: Int?

}
