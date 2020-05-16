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

class TodaysFixturesViewController: BaseTableViewController {
    
    var todaysFixturesViewModel: ITodaysFixturesViewModel?
    //var presenter: TodaysFixturesPresenter!
    override func getViewModel() -> BaseViewModel {
        return self.todaysFixturesViewModel as! BaseViewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cellID = "customMessageCell"
        todaysFixturesViewModel?.viewDidLoad1()
        tableView?.rowHeight = 150
    }
    override func doLoadData(callback: @escaping (([Any]) -> Void)) {
        todaysFixturesViewModel?.matchRespond()
        todaysFixturesViewModel?.matchResponse.subscribe({ (match) in
            if let items = match.element {
                callback(items)
            }
        }).disposed(by: disposeBag)
    }
    
}


