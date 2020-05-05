//
//  SummaryInfomation.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

protocol SummaryInfomation {
    func getHomeTeamName()-> String?
    func getAwayTeamName()-> String?
    func getHomeTeamScore()-> String?
    func getAwayTeamScore()-> String?
    func getMatchDay()-> String?
    func getStatus()-> String?
    func gettimeDisplay()-> String?
    func bindToInvestmentImage(imageView: UIImageView)
}

extension SummaryInfomation {
    func getHomeTeamName()-> String? {
        return nil
    }
    func getAwayTeamName()-> String? {
        return nil
    }
    func getHomeTeamScore()-> String? {
        return nil
    }
    func getAwayTeamScore()-> String? {
        return nil
    }
    func getMatchDay()-> String? {
        return nil
    }
    func getStatus()-> String? {
        return nil
    }
    func gettimeDisplay()-> String? {
        return nil
    }
    func bindToInvestmentImage(imageView: UIImageView) {
        
    }
}
