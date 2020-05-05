//
//  UIImage+Extention.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import SVGKit

extension UIImageView {
    func converUrlToSvgImage(url: String) {
       
             if url.contains(".svg") {
                
                  if let crestPath = URL(string: url) {
                    
                       DispatchQueue.global().async {
                           let data = try? Data(contentsOf: crestPath)
                           if let data = data {
                               if  let image: SVGKImage = SVGKImage(data: data){
                                   DispatchQueue.main.async {
                                     self.image = image.uiImage
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
    func converUrlToImage(url: String) {
         if  url.contains(".png") {
        
           if let crestPath = URL(string: url) {
               DispatchQueue.global().async {
                   let data = try? Data(contentsOf: crestPath)
                   if let data = data {
                       if  let image: UIImage = UIImage(data: data){
                           DispatchQueue.main.async {
                               self.image = image
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


