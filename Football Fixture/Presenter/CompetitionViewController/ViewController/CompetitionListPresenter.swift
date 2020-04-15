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

class CompetitionListPresenter: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var  competitionViewModel :ICompetitonViewModel?
    var  totalViewModel: ITotalTableViewModel?
    var fixtureViewModel: IFixturesViewModel?
    var currentCompetitionArray = CompetitionsModel.competitionlist
    var competionArray = CompetitionsModel.competitionlist
    var selectedIndex = 0
    var competitionMatch = TableRemoteImpl(config: .default)
    override func getViewModel() -> BaseViewModel {
        return self.competitionViewModel as! BaseViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        searchBar.placeholder = "Search For Competitions Name"
        competitionViewModel?.viewDidLoad1()
        competitionViewModel?.competitionRespond()
        competitionViewModel?.competitionResponse.subscribe({ (competition) in
            DispatchQueue.main.async {
                if let competitions = competition.element {
                    self.competionArray = competitions
                    self.currentCompetitionArray = self.competionArray
                    self.tableView.reloadData(  with: .simple(duration: 0.75, direction: .rotation3D(type: .deadpool),constantDelay: 0))
                    self.tableView.reloadData()
                  
                }
            }
            
            
            }).disposed(by: disposeBag)
        
          print(self.competionArray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
 
    func sendId(selectedIndex: IndexPath) {
        let competition =  currentCompetitionArray [selectedIndex.row]
                      let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if #available(iOS 13.0, *) {
                        let controller = storyboard.instantiateViewController(identifier: "showDetail") as! CompetitionDetailsTableViewPresenter
                        controller.competit = competition
                        print(competition.id!)
                       
                        self.navigationController?.pushViewController(controller, animated: true)
                    } else {
                        // Fallback on earlier versions
                    }
    
                  }
    
    
    
}

extension CompetitionListPresenter:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentCompetitionArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompetitionTableViewCell")!
        
        let competition = currentCompetitionArray[indexPath.row]
        
         if currentCompetitionArray.contains(competition){
        if let season = competition.currentSeason?.season{
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat =  "yyyy-MM-dd"
            let showDate = inputFormatter.date(from: season)
            inputFormatter.dateFormat =  "dd/MM/yyyy"
            let resultString = inputFormatter.string(from: showDate!)
            if let name = competition.competitionName{
                cell.textLabel?.text = "\(name)" + "  " + "\(resultString)"
            }
        }
        }
        
        cell.addTapGesture {
               print("Cell Pressed")
            self.sendId(selectedIndex: indexPath)
          }
        
        return cell
        
    }
    
    
 
}

extension CompetitionListPresenter: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentCompetitionArray = competionArray
            tableView.reloadData()
            return

        }
        currentCompetitionArray = competionArray.filter({ competition -> Bool in
            (competition.competitionName?.lowercased().contains(searchText.lowercased()))!
        })
        tableView.reloadData()
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

