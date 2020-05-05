//
//  OneTeamDetailsTableViewCell.swift
//  Football Fixture
//
//  Created by user on 02/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class SquadTableViewCell: UITableViewCell{

    @IBOutlet weak var playersNameLabel: UILabel!
    
    @IBOutlet weak var playersPositionLabel: UILabel!
    
    @IBOutlet weak var numberingLabel: UILabel!


    var data: squad! {
        didSet{
            if let teamN =  data.name, let PlayerPosition = data.position {
                 playersNameLabel.text = "\(String(teamN))"
                 playersPositionLabel.text =  "\(String(PlayerPosition))"
            }
        }
    }
    

    
}
