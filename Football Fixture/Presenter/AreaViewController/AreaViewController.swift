//
//  File.swift
//  Football Fixture
//
//  Created by user on 09/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class AreaViewController: UIViewController {
    @IBOutlet weak var areaTableView: UITableView!
    var selectedIndex = 0
    var areaArray = AreasModel.arealist
    
    override func viewDidLoad() {
        
        self.areaTableView.delegate = self
        self.areaTableView.dataSource = self
//        _ = AreaImpl.getArea(completion: { (areasRes) in
//
//            switch areasRes {
//                case .success(let areas):
//                self.areaArray = areas
//            case .failure(let err):
//                    print("Failed to fetch courses:", err)
//                }
//
//            self.areaTableView.reloadData()
//
//        })
    }
    
}



extension AreaViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return areaArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return areaArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell")!
        
        let area = areaArray[indexPath.row]
        
        cell.textLabel?.text = String(area.parentAreaId)
        
        
        
        return cell
        
    }
    
    //TODO: Declare configureTableView here:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
