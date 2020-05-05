//
//  CompetitionTableViewCell.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 19/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class CompetitionTableViewCell: UITableViewCell {
    let competitioCellModel = CompetitionCellViewModel()
    var data: competition! {
        didSet {
            competitioCellModel.bindProductToCell(cell: self, competition: data)
        }
    }
}
