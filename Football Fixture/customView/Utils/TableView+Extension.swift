//
//  TableView+Extension.swift
//  Gokada App iOS
//
//  Created by Emmanuel Okwara on 16/11/2019.
//  Copyright © 2019 Gokada. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .lightGray
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
         DispatchQueue.main.async {
        self.backgroundView = messageLabel;
        }
    }

    func restore() {
        DispatchQueue.main.async {
            self.backgroundView = nil
        }
        
    }
}
