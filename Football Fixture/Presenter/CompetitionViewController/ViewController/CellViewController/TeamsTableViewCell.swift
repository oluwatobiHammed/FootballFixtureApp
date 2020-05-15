//
//  TeamsTableViewCell.swift
//  Football Fixture
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import SVGKit
import WebKit

class TeamsTableViewCell: UITableViewCell {
    @IBOutlet weak var teamPositionLabel: UILabel!
    @IBOutlet weak var teamCrestPngImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamPlayedGamesLabel: UILabel!
    @IBOutlet weak var teamPointsLabel: UILabel!
    @IBOutlet weak var teamLogoWebView: WKWebView!
    @IBOutlet weak var teamGoalDifferenceLabel: UILabel!
    let tableCellModel = CompetitionTableCellViewModel()
    var data: table!{
        didSet{
            tableCellModel.bindProductToCell(cell: self, table: data)
        }
    }
    
}


