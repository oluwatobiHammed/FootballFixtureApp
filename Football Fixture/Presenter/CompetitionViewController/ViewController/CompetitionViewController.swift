//
//  CompetitionListPresenter.swift
//  Football Fixture
//
//  Created by user on 10/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
import TableViewReloadAnimation
import RxSwift
import RxCocoa
import RealmSwift

class CompetitionViewController: BaseTableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var  competitionViewModel :ICompetitonViewModel?
    var currentCompetitionArray = CompetitionsModel.competitionlist
    var presenter: Competition!
    var competitionArray = [Competition]()
    var requestPortfolioDetailNavigation: ((_ competition: competition)-> Void)?
    override func getViewModel() -> BaseViewModel {
        return self.competitionViewModel as! BaseViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        cellID = "CompetitionTableViewCell"
        searchBar.placeholder = "Search For Competitions Name"
        competitionViewModel?.viewDidLoad1()
    }
    
    override func doLoadData(callback: @escaping (([Any]) -> Void)) {
       
        competitionViewModel?.competitionRespond()
        competitionViewModel?.competitionResponse.subscribe({ (competitions) in
            if let items = competitions.element {
                let id = [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
                for  id in id {
                    for item in items{
                        if item.id == id {
                            let tierOneCompetition = Competition()
                            if let season = item.currentSeason?.season, let name = item.competitionName, let id = item.id {
                                tierOneCompetition.competitionName = name
                                tierOneCompetition.id = id
                                tierOneCompetition.Season = season
                                print(tierOneCompetition.competitionName)
                            }
                            
                            self.competitionArray.append(tierOneCompetition)
                        }
                    }
                }
                
                callback(self.competitionArray)
                //self.currentCompetitionArray = items
                
                //self.itemsToRender = self.currentCompetitionArray
            }
        }).disposed(by: disposeBag)
        
    }
    
    
    override func sendId(selectedIndex: Int) {
        presenter =  competitionArray[selectedIndex]
        let _ = StoryBoardsID.competition.navigationProvider.requestNavigation(to: ViewControllerID.showDetail.rawValue, from: self, requestData: presenter)
    }
    
    
    
}


extension CompetitionViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            itemsToRender = currentCompetitionArray
            return
            
        }
        itemsToRender = currentCompetitionArray.filter({ competition -> Bool in
            (competition.competitionName?.lowercased().contains(searchText.lowercased()))!
        })
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

