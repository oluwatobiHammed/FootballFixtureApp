//
//  CompetitionCellViewModel.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class CompetitionCellViewModel {
     func bindProductToCell(cell: CompetitionTableViewCell, competition: Competition) {
         //let
         let name = competition.competitionName, season = competition.Season
               cell.textLabel?.text = "\(name)" + "  " + "\(Date.dateFormatter(string: season))"
               cell.textLabel?.sizeToFit()
               cell.textLabel?.textColor = .white
               
           
       
      }
    
 
}
