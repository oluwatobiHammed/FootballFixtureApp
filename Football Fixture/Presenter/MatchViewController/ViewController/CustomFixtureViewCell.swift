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
    
    var fixture: Match! {
        didSet {
 guard let matchTime = fixture.status else {fatalError()}
            let updatedTime = fixture.lastUpdated.suffix(15)
            let timeUpdate = updatedTime.prefix(2)
            timeDisplayLabel.text = "\(matchTime)"
            lastUpdatedLabel.text = "\(timeUpdate)'"
            if let matchD = fixture.season?.currentMatchday{
                matchDayLabel.text = "MD:\(matchD)"
            }
            
            if let homeT = fixture.homeTeam?.name{
                homeTeamLabel.text = homeT
            }
            if let awayT = fixture.awayTeam?.name{
                awayTeamLabel.text = awayT
            }
            
            if let hTScore =  fixture.score?.fullTime?.homeTeam {
                homeTeamScoreLabel.text = String(hTScore)
            }
            
            if let aTScore = fixture.score?.fullTime?.awayTeam{
                awayTeamScoreLabel.text =  String(describing:aTScore)
            }
        }
    }

    
    
}
