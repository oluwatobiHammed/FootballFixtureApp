//
//  TeamsTableViewCell.swift
//  Football Fixture
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import SVGKit

class TeamsTableViewCell: UITableViewCell {
    @IBOutlet weak var teamPositionLabel: UILabel!
    @IBOutlet weak var teamCrestPngImage: UIImageView!
    @IBOutlet weak var teamCrestSvgImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamPlayedGamesLabel: UILabel!
    @IBOutlet weak var teamPointsLabel: UILabel!
    @IBOutlet weak var teamGoalDifferenceLabel: UILabel!
    
    var table: table!{
        didSet{
            guard let teamPosition = table.position else {fatalError()}
            teamPositionLabel.text = "\(teamPosition)"
            if let teamName =  table.team?.name{
                teamNameLabel.text = "\(teamName)"
            }
            guard let playedGames = table.playedGames else{fatalError()}
            teamPlayedGamesLabel.text = "\(playedGames)"
            guard let points = table.points else{fatalError()}
            teamPointsLabel.text =  "\(points)"
            guard let goalDifference = table.goalDifference else {fatalError()}
            teamGoalDifferenceLabel.text = "\(goalDifference)"
            guard let teamCrest = table.team?.crestUrl else{fatalError()}
            teamCrestPngImage.image = UIImage(named: "icons8-soccer-ball-100")
            
            
            if let crestPath = URL(string:teamCrest) {
                if crestPath.pathExtension.lowercased() == "svg"{
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: crestPath)
                        if let data = data {
                            if  let image: SVGKImage = SVGKImage(data: data){
                                DispatchQueue.main.async {
                                    self.teamCrestSvgImage.image = image.uiImage
                                    self.setNeedsLayout()
                                }
                                
                            }
                        }
                        
                    }
                    
                    
                }else if crestPath.pathExtension.lowercased() == "png"{
                    if let crestPath = URL(string: teamCrest) {
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: crestPath)
                            if let data = data {
                                if  let image: UIImage = UIImage(data: data){
                                    DispatchQueue.main.async {
                                        self.teamCrestPngImage.image = image
                                        self.setNeedsLayout()
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}


