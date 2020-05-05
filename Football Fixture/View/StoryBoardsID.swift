//
//  StoryBoardsID.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

enum StoryBoardsID: String {
    case boardMain = "Main"
    case competition = "League"
    case todayMatches = "TodayMatch"
    
    var navigationProvider: UINavigationProvider {
        return self.rawValue.asStoryboard()
    }
    static func gotoStartPage(){
        let _ = StoryBoardsID.boardMain.navigationProvider.makeAsRoot(using: ViewControllerID.boardMainApplicationRoot.rawValue)
    }
    
    static func gotoLeague() {
         let _ = StoryBoardsID.competition.navigationProvider.makeAsRoot(using: ViewControllerID.competitionIntro.rawValue)
     }
    static func gotoMatch() {
        let _ = StoryBoardsID.todayMatches.navigationProvider.makeAsRoot(using: ViewControllerID.matchIntro.rawValue)
    }
}


enum ViewControllerID: String {
  case boardMainApplicationRoot = "applicationRoot"
    
    
  case competitionIntro = "LeagueRoot"
  case showDetail = "showDetail"
  case squadVC = "squadVC"
    
  case matchIntro = "MatchRoot"
    
}
