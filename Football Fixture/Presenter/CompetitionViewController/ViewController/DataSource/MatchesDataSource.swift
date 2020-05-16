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
    
    var matchesList = [Matches]()
    var sections = [FixtureSection]()
    init(matchesList: [Matches], sections: [FixtureSection]) {
        self.matchesList = matchesList
        self.sections = sections
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
         return sections[section].title
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as? FixturesTableViewCell
        print("This the TableView", matchesList[indexPath.row])
        cell?.data = matchesList[indexPath.row]
        cell?.selectionStyle = .none
        return cell!
    }
    
}

extension MatchesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? FixturesTableViewCell {
            cell.data = matchesList[indexPath.row]
        }
    }
    
}

