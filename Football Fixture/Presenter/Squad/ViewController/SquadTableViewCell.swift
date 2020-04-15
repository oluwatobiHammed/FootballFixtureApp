//
//  OneTeamDetailsTableViewCell.swift
//  Football Fixture
//
//  Created by user on 02/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class SquadTableViewCell: UITableViewCell {

    @IBOutlet weak var playersNameLabel: UILabel!
    
    @IBOutlet weak var playersPositionLabel: UILabel!
    
    @IBOutlet weak var numberingLabel: UILabel!
    
    var oneTeam: squad! {
        didSet{
            if let teamN =  oneTeam.name {
                 playersNameLabel.text = "\(String(teamN))"
            }
            if let PlayerPosition = oneTeam.position{
                            
                playersPositionLabel.text =  "\(String(PlayerPosition))"
                }
        }
    }
}
