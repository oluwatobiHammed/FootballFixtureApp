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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToRender.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CustomFixtureViewCell {
            cell.data = itemsToRender[indexPath.row] as? Match
            cell.selectionStyle = .none
            return cell
        }
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? TeamsTableViewCell {
            cell.data = itemsToRender[indexPath.row] as? table
            cell.selectionStyle = .none
            return cell
        }
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? SquadTableViewCell {
                 cell.data = itemsToRender[indexPath.row] as? squad
                 cell.numberingLabel.text = "\((indexPath.row + 1))"
                cell.selectionStyle = .none
                return cell
            }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CompetitionTableViewCell
        cell?.addTapGesture {
            self.sendId(selectedIndex: indexPath.row)
        }
        cell?.data = itemsToRender[indexPath.row] as? competition
        cell?.backgroundColor = UIColor.clear
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    
}

extension BaseTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? CustomFixtureViewCell {
            updateContentOfCell(cell: cell, data: itemsToRender[indexPath.row])
            cell.data = itemsToRender[indexPath.row] as? Match
        }
        if let cell = cell as? CompetitionTableViewCell {
            updateContentOfCell(cell: cell, data: itemsToRender[indexPath.row])
        }
    }
    
}
