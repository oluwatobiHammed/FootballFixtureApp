//
//  CustonFixtureViewCell.swift
//  Football Fixture
//
//  Created by user on 11/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class CustomFixtureViewCell: UITableViewCell {
    

    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var timeDisplayLabel: UILabel!
    @IBOutlet weak var matchDayLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    let matchCellModel = MatchCellViewModel()
  
    var data: Match! {
        didSet {
          matchCellModel.bindProductToCell(cell: self, match: data)
        }
    }


}
