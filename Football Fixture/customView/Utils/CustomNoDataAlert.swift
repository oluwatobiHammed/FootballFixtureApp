//
//  CustomNoDataAlert.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 21/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit


class CustomNoDataAlert {
       let messageImageView = UIImageView()
       let titleLabel = UILabel()
       let messageLabel = UILabel()
       let parentView: UIView
    init(on parentView: UIView) {
        self.parentView = parentView
    }
    
    func setEmptyView(title: String, message: String, messageImage: UIImage) {
        
   
        
        messageImageView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        parentView.addSubview(titleLabel)
        parentView.addSubview(messageImageView)
        parentView.addSubview(messageLabel)
        
        messageImageView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: -20).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        
        messageImageView.image = messageImage
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        UIView.animate(withDuration: 1, animations: {
            
            self.messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                self.messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    self.messageImageView.transform = CGAffineTransform.identity
                })
            })
            
        })
        
    }
}

