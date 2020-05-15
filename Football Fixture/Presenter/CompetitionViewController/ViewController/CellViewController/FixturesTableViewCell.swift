//
//  FixturesTableViewCell.swift
//  Football Fixture
//
//  Created by user on 01/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {

  @IBOutlet weak var homeTeamLabel: UILabel!
     @IBOutlet weak var awayTeamLabel: UILabel!
     @IBOutlet weak var homeTeamScoreLabel: UILabel!
     @IBOutlet weak var awayTeamScoreLabel: UILabel!
     @IBOutlet weak var timeDisplayLabel: UILabel!
     @IBOutlet weak var matchDayLabel: UILabel!
     @IBOutlet weak var lastUpdatedLabel: UILabel!
     
      let matchCellModel = MatchCellViewModel()
     
       var data: Matches! {
           didSet {
             matchCellModel.bindProductToCell(cell: self, match: data)
           }
       }

     

}
