//
//  BaseTableView+DataSource.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

extension BaseTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sectionss = itemsToRender as? [FixtureSection] {
            return sectionss.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sectionss = itemsToRender as? [FixtureSection] {
            return sectionss[section].title
        }
        return ""
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionss = itemsToRender as? [FixtureSection] {
            return sectionss[section].matches.count
        }else {
            return itemsToRender.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CustomFixtureViewCell {
            
            cell.selectionStyle = .none
            return cell
        }
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? TeamsTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? SquadTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CompetitionTableViewCell
        cell?.backgroundColor = UIColor.clear
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    
}

extension BaseTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let cell = cell as? CustomFixtureViewCell {
            if let data = itemsToRender as? [FixtureSection] {
                cell.data = data[indexPath.section].matches[indexPath.row]
            }
        }
        
        if let cell = cell as? CompetitionTableViewCell {
            cell.data = itemsToRender[indexPath.row] as? Competition
            cell.addTapGesture {
                self.sendId(selectedIndex: indexPath.row)
            }
        }
        if let cell = cell as? TeamsTableViewCell {
            cell.data = itemsToRender[indexPath.row] as? table
        }
        if let cell = cell as? SquadTableViewCell {
            cell.data = itemsToRender[indexPath.row] as? squad
        }
    }
    
}


import Foundation


struct FixtureSection {
    let title:String
    let matches:[Matches]
}
