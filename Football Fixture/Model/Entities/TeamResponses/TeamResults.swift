//
//  TeamResults.swift
//  Football Fixture
//
//  Created by user on 22/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
struct TeamResults: Codable {
    let results: [Teams]?
    
   

    enum CodingKeys: String, CodingKey{
        case results = "teams"
        
        
        
    }
}


