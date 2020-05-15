//
//  CompetitionDataSource.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 19/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
class TeamDataSource: NSObject, UICollectionViewDataSource {
    
    let viewController: CompetitionDetailsTableViewPresenter?
    var teamList = [Teams]()
    init(teamList: [Teams],viewController: CompetitionDetailsTableViewPresenter) {
        self.teamList = teamList
        self.viewController = viewController
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamcell", for: indexPath) as! TeamsCollectionViewCell
        let team = teamList[indexPath.row]
        cell.team = team
        cell.addTapGesture {
            let _ = StoryBoardsID.competition.navigationProvider.requestNavigation(to: ViewControllerID.squadVC.rawValue, from: self.viewController, requestData: team, mode: .modal)
        }
        return cell
    }
}



