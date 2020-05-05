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


class CompetitionViewController: BaseTableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var  competitionViewModel :ICompetitonViewModel?
    var currentCompetitionArray = CompetitionsModel.competitionlist
    var presenter: CompetitionPresenter!
    var requestPortfolioDetailNavigation: ((_ competition: competition)-> Void)?
    override func getViewModel() -> BaseViewModel {
        return self.competitionViewModel as! BaseViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        cellID = "CompetitionTableViewCell"
        searchBar.placeholder = "Search For Competitions Name"
        competitionViewModel?.viewDidLoad1()
    }

    override func doLoadData(callback: @escaping (([Any]) -> Void)) {
        competitionViewModel?.competitionRespond()
            competitionViewModel?.competitionResponse.subscribe({ (competition) in
                if let items = competition.element {
                    self.currentCompetitionArray = items
                     callback(items)
                    self.itemsToRender = self.currentCompetitionArray
                }
            }).disposed(by: disposeBag)
      
     }
    
    
    override func sendId(selectedIndex: Int) {
        let competitions =  itemsToRender[selectedIndex] as? competition
        let _ = StoryBoardsID.competition.navigationProvider.requestNavigation(to: ViewControllerID.showDetail.rawValue, from: self, requestData: competitions?.id, requestDataToo: competitions?.currentSeason?.currentMatchday)
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
