//
//  TeamsCollectionViewCell.swift
//  Football Fixture
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import SVGKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var teamLabel: UILabel!
   
    
    
    var team:  Teams! {
        didSet{
            if let teamName = team.name {
                teamLabel.text = teamName
            }
            if let teamCrest = team.crestUrl {
                if teamCrest.contains(".svg") {
                   
                     if let crestPath = URL(string: teamCrest) {
                       
                          DispatchQueue.global().async {
                              let data = try? Data(contentsOf: crestPath)
                              if let data = data {
                                  if  let image: SVGKImage = SVGKImage(data: data){
                                      DispatchQueue.main.async {
                                        self.imageView.image = image.uiImage
                                        self.layer.borderColor = UIColor.lightGray.cgColor
                                        self.layer.borderWidth = 0.5
                                        self.setNeedsLayout()
                                      }
                                  }

                              }

                          }
                     }
                  } else if  teamCrest.contains(".png") {
                   
                      if let crestPath = URL(string: teamCrest) {
                          DispatchQueue.global().async {
                              let data = try? Data(contentsOf: crestPath)
                              if let data = data {
                                  if  let image: UIImage = UIImage(data: data){
                                      DispatchQueue.main.async {
                                          self.imageView1.image = image
                                          self.layer.borderColor = UIColor.lightGray.cgColor
                                          self.layer.borderWidth = 0.5
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
