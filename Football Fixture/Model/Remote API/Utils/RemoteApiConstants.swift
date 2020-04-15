//
//  RemoteApiConstants.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

class RemoteApiConstants {
    
    enum Endpoints {
        static let base = "http://api.football-data.org/v2"
        case getCompetitions
        case getMatches
        case getArea
        case getCompetitionMatches(Int)
        case getTable(Int)
        case getTeam(Int)
        case getOneTeam(Int)
        case getPlayer(Int)

        var stringValue: String {
            switch self {
                
            case .getArea:
                return     Endpoints.base + "/areas/"
            case .getCompetitions:
                return     Endpoints.base  + "/competitions/"
            case .getMatches:
                return     Endpoints.base  + "/competitions/2021/matches?matchday=1"
            case.getTable(let id):
                return     Endpoints.base  + "/competitions/\(id)/standings"
            case.getTeam(let id):
                return     Endpoints.base  + "/competitions/\(id)/teams"
            case .getOneTeam(let id):
                    return Endpoints.base  + "/teams/\(id)"
            case .getCompetitionMatches(let id):
                return     Endpoints.base  + "/competitions/\(id)/matches?matchday=1"
            case .getPlayer(let id):
                return     Endpoints.base + "/players/\(id)"
            }
        }
        
         var url: URL {
            return (URL(string: stringValue))!
        }
    }
    
}

