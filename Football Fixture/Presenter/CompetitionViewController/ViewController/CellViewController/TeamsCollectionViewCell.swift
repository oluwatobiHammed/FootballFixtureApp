//
//  TeamsCollectionViewCell.swift
//  Football Fixture
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
class TeamsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var teamLabel: UILabel!

    var team:  Teams! {
        didSet{
            if let teamName = team.name {
                teamLabel.text = teamName
            }
            if let imageUrl = team.crestUrl {
                imageView.converUrlToImage(url: imageUrl)
                imageView1.converUrlToSvgImage(url: imageUrl)
            }
        }
    }
    
}
