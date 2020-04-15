//
//  Score.swift
//  Football Fixture
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct Score: Codable, Equatable {
    let fullTime:FullTime?
}

struct FullTime: Codable, Equatable{
    let homeTeam: Int
    let awayTeam: Int
    
}
