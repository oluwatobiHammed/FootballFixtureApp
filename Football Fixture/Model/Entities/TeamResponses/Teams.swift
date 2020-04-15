//
//  Team.swift
//  Football Fixture
//
//  Created by user on 22/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct Teams: Codable, Equatable {
    let id: Int
    let name: String?
    let crestUrl: String?
    let shortName: String
   
    enum CodingKeys: String, CodingKey {
        case id 
        case name
        case crestUrl
        case shortName
    }
}


