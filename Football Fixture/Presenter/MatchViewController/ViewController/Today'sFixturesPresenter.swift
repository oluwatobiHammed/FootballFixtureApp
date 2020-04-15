//
//  CompetitionListTableViewPresenter.swift
//  Football Fixture
//
//  Created by user on 10/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TodaysFixturesPresenter: BaseViewController {
    @IBOutlet var tableView: UITableView!
    var selectedIndex = 0
    var todaysFixturesViewModel: ITodaysFixturesViewModel?
    
    override func getViewModel() -> BaseViewModel {
        return self.todaysFixturesViewModel as! BaseViewModel
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        todaysFixturesViewModel?.viewDidLoad1()
        todaysFixturesViewModel?.matchRespond()
        todaysFixturesViewModel?.matchResponse.subscribe({ (match) in
              print(match)
              DispatchQueue.main.async {
            MatchesModel.matchesList = match.element!
            self.tableView.reloadData()
            }
            }).disposed(by: disposeBag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
              self.tableView?.register(UINib(nibName: "FixturesTableViewCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        tableView.reloadData()
        
        
    }
    
}

extension TodaysFixturesPresenter: UITableViewDataSource, UITableViewDelegate {

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MatchesModel.matchesList.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell")  as? CustomFixtureViewCell
        let match = MatchesModel.matchesList[indexPath.row]
         cell?.fixture = match
        return cell!
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            print("Cell Pressed")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

}
