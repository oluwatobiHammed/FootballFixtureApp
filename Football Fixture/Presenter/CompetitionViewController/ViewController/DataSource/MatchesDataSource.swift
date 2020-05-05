//
//  FixturesDetailsPresenter.swift
//  Football Fixture
//
//  Created by user on 26/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
class MatchesDataSource: NSObject, UITableViewDataSource  {
    
    var matchesList = [Match]()
    
    init(matchesList: [Match]) {
        self.matchesList = matchesList
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell")  as? FixturesTableViewCell
        cell?.data = matchesList[indexPath.row]
        cell?.selectionStyle = .none
        return cell!
    }
    
}


