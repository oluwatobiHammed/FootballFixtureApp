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
    func bindProductToCell(cell: CustomFixtureViewCell, match: Matches) {
        if let homeTeam = match.homeTeam?.name, let awayTeam = match.awayTeam?.name {
            cell.homeTeamLabel.text = homeTeam
            cell.awayTeamLabel.text = awayTeam
        }
        
        if let homeTeamScore = match.score?.fullTime.homeTeam, let awayTeamScore = match.score?.fullTime.awayTeam {
            cell.homeScoreLabel.text = "\(homeTeamScore)"
            cell.awayScoreLabel.text = "\(awayTeamScore)"
        }
        
        if let status = match.status , let matchTime = match.utcDate {
            cell.statusLabel.text = status
            cell.matchTimeLabel.text = dateToTime(matchTime)
            
            switch status {
                  case "IN_PLAY","PAUSED":
                    cell.setUpCellColor(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
                  case "SCHEDULED","FINISHED":
                    cell.setUpCellColor(color: #colorLiteral(red: 0.9742844701, green: 0.7410509586, blue: 0.3146140575, alpha: 1))
                  default:
                    cell.setUpCellColor(color: #colorLiteral(red: 0.8599768877, green: 0.1257156432, blue: 0.1353015304, alpha: 1))
                  }
                  
              }
        }
       
      
    
 
  
    
    func bindProductToCell(cell: FixturesTableViewCell, match: Matches) {
         if let homeTeam = match.homeTeam?.name, let awayTeam = match.awayTeam?.name {
              cell.homeTeamLabel.text = homeTeam
              cell.awayTeamLabel.text = awayTeam
          }
          
          if let homeTeamScore = match.score?.fullTime.homeTeam, let awayTeamScore = match.score?.fullTime.awayTeam {
              cell.homeScoreLabel.text = "\(homeTeamScore)"
              cell.awayScoreLabel.text = "\(awayTeamScore)"
          }
          
          if let status = match.status , let matchTime = match.utcDate {
              cell.statusLabel.text = status
              cell.matchTimeLabel.text = dateToTime(matchTime)
              
              switch status {
                    case "IN_PLAY","PAUSED":
                      cell.setUpCellColor(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
                    case "SCHEDULED","FINISHED":
                      cell.setUpCellColor(color: #colorLiteral(red: 0.9742844701, green: 0.7410509586, blue: 0.3146140575, alpha: 1))
                    default:
                      cell.setUpCellColor(color: #colorLiteral(red: 0.8599768877, green: 0.1257156432, blue: 0.1353015304, alpha: 1))
                    }
                    
                }
      
     }
    
 
}


