//
//  ApplicationTabViewController.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class ApplicationTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var index = 0
        self.tabBar.barTintColor = .clear
        self.view.backgroundColor = .clear
        self.viewControllers?.forEach({ (controller) in
            var item: UITabBarItem? = nil
            if index == 0 {
                item = UITabBarItem()
                item?.title = "Today"
                item?.image = UIImage(named: "soccer-3")?.withRenderingMode(.alwaysOriginal)
                item?.selectedImage = UIImage(named: "soccer-3")?.withRenderingMode(.alwaysOriginal)
            }
            else if index == 1 {
                item = UITabBarItem()
                item?.title = "League"
                item?.image = UIImage(named: "soccer-field-2")?.withRenderingMode(.alwaysOriginal)
                item?.selectedImage = UIImage(named: "soccer-field-2")?.withRenderingMode(.alwaysOriginal)
            }
       if let theItem = item {
                         item?.setTitleTextAttributes([
                             NSAttributedString.Key.foregroundColor : UIColor.white,
//                             NSAttributedString.Key.font : FontStyle.Default.getFont(sizeBy: -1)
                         ], for: UIControl.State.normal)
                         
                         item?.setTitleTextAttributes([
                             NSAttributedString.Key.foregroundColor : ThemeManager.currentTheme().mainColor
                         ], for: UIControl.State.selected)
                         
                         controller.tabBarItem = theItem
                         
                     }
            index += 1
        })
        
    }
}

