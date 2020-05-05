//
//  NavigationViewController.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var showFullScreen: Bool = true {
        didSet {
            if self.isViewLoaded {
                if showFullScreen {
                    self.setNavigationBarHidden(true, animated: true)
                }
                else{
                    self.setNavigationBarHidden(false, animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showFullScreen {
            self.setNavigationBarHidden(true, animated: true)
        }
        else{
            self.setNavigationBarHidden(false, animated: true)
        }
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = true
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.tintColor = ThemeManager.currentTheme().mainColor

        let backImageForDefaultBarMetrics = UIImage(named: "nav_background")
        navigationBar.setBackgroundImage(backImageForDefaultBarMetrics, for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
