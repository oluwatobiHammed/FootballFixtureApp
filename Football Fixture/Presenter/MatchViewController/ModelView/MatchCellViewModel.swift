//
//  MatchCellViewModel.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 21/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class MatchCellViewModel {
     func bindProductToCell(cell: CustomFixtureViewCell, match: Match) {
        if let homeTeam = match.homeTeam?.name, let awayTeam = match.awayTeam?.name {
            cell.homeTeamLabel.text = homeTeam
            cell.awayTeamLabel.text = awayTeam
        }
        
        if let homeTeamScore = match.score?.fullTime?.homeTeam, let awayTeamScore = match.score?.fullTime?.awayTeam {
            cell.homeTeamScoreLabel.text = "\(homeTeamScore)"
            cell.awayTeamScoreLabel.text = "\(awayTeamScore)"
        }
        
        if let status = match.status, let matchDay = match.season?.currentMatchday  {
            let lastTimeUpdate = match.lastUpdated
            cell.timeDisplayLabel.text = status 
            cell.lastUpdatedLabel.text = String(lastTimeUpdate.suffix(15).prefix(2))
            cell.matchDayLabel.text = "MD:\(matchDay)"
        }
       
      }
    
    func bindProductToCell(cell: FixturesTableViewCell, match: Match) {
       if let homeTeam = match.homeTeam?.name, let awayTeam = match.awayTeam?.name {
           cell.homeTeamLabel.text = homeTeam
           cell.awayTeamLabel.text = awayTeam
       }
       
       if let homeTeamScore = match.score?.fullTime?.homeTeam, let awayTeamScore = match.score?.fullTime?.awayTeam {
           cell.homeTeamScoreLabel.text = "\(homeTeamScore)"
           cell.awayTeamScoreLabel.text = "\(awayTeamScore)"
       }
       
       if let status = match.status, let matchDay = match.season?.currentMatchday  {
           let lastTimeUpdate = match.lastUpdated
           cell.timeDisplayLabel.text = status
           cell.lastUpdatedLabel.text = String(lastTimeUpdate.suffix(15).prefix(2))
           cell.matchDayLabel.text = "MD:\(matchDay)"
       }
      
     }
    
 
}


