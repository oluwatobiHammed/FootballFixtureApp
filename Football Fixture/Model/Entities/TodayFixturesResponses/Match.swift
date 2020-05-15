//
//  Match.swift
//  Football Fixture
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation


struct Matches:Codable {
    let utcDate:Date?
    let status:String?
    let homeTeam:FixtureTeam?
    let awayTeam:FixtureTeam?
    let score:Score?
}

struct FixtureTeam:Codable {
    let id:Int?
    let name:String?
}

struct Score:Codable{
    let fullTime:ScoreTime
}

struct ScoreTime:Codable{
    let homeTeam:Int?
    let awayTeam:Int?
}
//protocol FeedItems {}
