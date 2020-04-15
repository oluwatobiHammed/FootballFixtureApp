//
//  competition.swift
//  Football Fixture
//
//  Created by user on 08/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class competition:  Object, Codable {
   public dynamic var id: Int?
   public dynamic var competitionName: String?
   public dynamic var currentSeason: currentSeason?

    enum CodingKeys: String, CodingKey {
        case id
        case competitionName = "name"
        case currentSeason
    }
    
    
}


