//
//  TeamsCollectionViewCell.swift
//  Football Fixture
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import WebKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var logoWebView: WKWebView!
    
    var team:  Teams! {
        didSet{
            if let teamName = team.name {
                teamLabel.text = teamName
            }
            if let imageUrl = team.crestUrl {
                logoWebView.displayTeamImages(url: imageUrl)
                logoWebView.scrollView.isScrollEnabled = false
            }else {
                print("no Image")
                //imageView.image = UIImage(named: "icons8-soccer-ball-100")
            }
        }
    }
    
}
