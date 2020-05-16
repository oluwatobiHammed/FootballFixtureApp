//
//  FixturesTableViewCell.swift
//  Football Fixture
//
//  Created by user on 01/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {

  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var matchTimeLabel: UILabel!
  @IBOutlet weak var homeTeamLabel: UILabel!
  @IBOutlet weak var awayTeamLabel: UILabel!
  @IBOutlet weak var homeScoreLabel: UILabel!
  @IBOutlet weak var awayScoreLabel: UILabel!
  @IBOutlet weak var cellView: UIView!
     
      let matchCellModel = MatchCellViewModel()
     
       var data: Matches? {
           didSet {
            if let data = data {
               matchCellModel.bindProductToCell(cell: self, match: data)
            }
            
           }
       }
    
    func setUpCellColor(color:UIColor){
            statusView.backgroundColor = color
            cellView.layer.borderColor = color.cgColor
       }

     

}
