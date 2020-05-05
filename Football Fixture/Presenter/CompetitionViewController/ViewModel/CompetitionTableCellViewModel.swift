//
//  CompetitionTableCellViewModel.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 04/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//


import Foundation
import UIKit

class CompetitionTableCellViewModel {
     func bindProductToCell(cell: TeamsTableViewCell, table: table) {
        if let teamName = table.team?.name, let playedGames = table.playedGames, let teamPosition = table.position,  let points = table.points, let goalDifference = table.goalDifference, let teamCrest = table.team?.crestUrl  {
            cell.teamNameLabel.text = teamName
            cell.teamPlayedGamesLabel.text = "\(playedGames)"
            cell.teamPositionLabel.text = "\(teamPosition)"
            cell.teamPointsLabel.text = "\(points)"
            cell.teamGoalDifferenceLabel.text = "\(goalDifference)"
            cell.teamCrestPngImage.image = UIImage(named: "icons8-soccer-ball-100")
            cell.teamCrestPngImage.converUrlToImage(url: teamCrest)
            cell.teamCrestSvgImage.converUrlToSvgImage(url: teamCrest)
           }
       
      }
    
 
}


