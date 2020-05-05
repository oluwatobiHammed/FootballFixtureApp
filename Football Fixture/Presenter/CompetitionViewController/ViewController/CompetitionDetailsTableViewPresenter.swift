//
//  CompetitionDetailsTableViewPresenter.swift
//  Football Fixture
//
//  Created by user on 13/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import SnapKit
import Foundation
import RxSwift
import RxCocoa


class CompetitionDetailsTableViewPresenter: BaseTableViewController {
 
    
 
    
    
    //    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var segmentedView: UIView!
    var matchDataSource: MatchesDataSource?
    var teamDataSource: TeamDataSource?
    var matchList: [Match] = []
    var teamList: [Teams] = []
    override var presentRequestData: Any? {
        didSet {
            
        }
    }
    override var presentRequestDataToo: Any? {
        didSet {
            
        }
    }
    
    var totalViewModel: ICompetitionDetailsViewModel?
    let titles = "Table ,Fixtures, Team"
    var competit: competition?
    var noDataAlert: CustomNoDataAlert?
    fileprivate var alert: CustomAlert?
    var segmentedControl: CustomSegmentedContrl!
    override func getViewModel() -> BaseViewModel {
        return self.totalViewModel as! BaseViewModel
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //emtyTableView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ssss()
        cellID = "totalCell"
        // noDataAlert = CustomNoDataAlert.init(on: emptyView)
        refreshData()
        totalViewModel?.viewDidLoad1()
    }
    
//     func cellTaped(data: IndexPath) {
//        print(data)
//        let team = teamList[data.row]
//        let _ = StoryBoardsID.competition.navigationProvider.requestNavigation(to: ViewControllerID.squadVC.rawValue, requestData: team, mode: .modal)
//      }
    func showNoDataAlert(title: String, message: String, messageImage: UIImage) {
        self.noDataAlert?.setEmptyView(title: title, message: message, messageImage: messageImage)
    }
    
    override func doLoadData(callback: @escaping (([Any]) -> Void)) {
        totalViewModel?.updateTable(getID: presentRequestData as! Int)
        totalViewModel?.tableResponse.bind(onNext: {(standing) in
            if let tables = standing[0].table{
                callback(tables)
            }
        }).disposed(by: disposeBag)
        
        totalViewModel?.fixtureRespond(getID:presentRequestData as! Int, getMD: presentRequestDataToo as! Int)
        totalViewModel?.updateTeam(getID: presentRequestData as! Int)
        
        
    }
    
    
    private func refreshData() {
        totalViewModel?.fixtureResponse.subscribe({ [weak self] (match) in
            if let matches = match.element {
                self?.matchDataSource = MatchesDataSource(matchesList: matches)
                self?.matchList = matches
                DispatchQueue.main.async {
                    self?.tableView?.reloadData()
                }
            }
        }).disposed(by: disposeBag)
        
        totalViewModel?.teamResponse.subscribe({ [weak self] (team) in
            if let teams = team.element {
                self?.teamDataSource = TeamDataSource(teamList: teams, viewController: self!)
                self?.teamList = teams
                DispatchQueue.main.async {
                    self?.collectionView?.reloadData()
                }
            }
        }).disposed(by: disposeBag)
        
    }
    
    func ssss() {
        segmentedControl = CustomSegmentedContrl.init(frame: CGRect.init(x: 0, y: 30, width: self.view.frame.width, height: 40))
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .clear
        segmentedControl.commaSeperatedButtonTitles  = titles
        segmentedControl.selectorTextColor = .blue
        segmentedControl.updateView()
        
        segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
        
        segmentedView.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedView)
            make.leading.equalTo(segmentedView)
            make.trailing.equalTo(segmentedView)
            make.bottom.equalTo(segmentedView)
            
        }
        
        
    }
    
    
}


extension CompetitionDetailsTableViewPresenter{
    @objc func onChangeOfSegment(_ sender: CustomSegmentedContrl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableView?.alpha = 1
            collectionView?.alpha = 0
            tableView?.dataSource = self
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        //emtyTableView()
        case 1:
            tableView?.alpha = 1
            collectionView?.alpha = 0
            tableView?.dataSource = matchDataSource
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        //emtyMatchView()
        case 2:
            tableView?.alpha = 0
            collectionView?.alpha = 1
            collectionView?.dataSource = teamDataSource
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        //emtyTeamView()
        default:
            break
        }
    }
    
    //    func emtyTableView() {
    //        if self.items.count <= 0 {
    //            showNoDataAlert(title: "No Table is avaliable for this competition", message: "Avaliable Table will show here", messageImage: #imageLiteral(resourceName: "swipe-right (1)"))
    //            tableView?.alpha = 0
    //            collectView?.alpha = 0
    //            emptyView.alpha = 1
    //        }else{
    //            DispatchQueue.main.async {
    //                self.emptyView.alpha = 0
    //                //self.tableView?.dataSource = self
    //                self.tableView?.alpha = 1
    //                self.collectView?.alpha = 0
    //                self.tableView?.reloadData()
    //            }
    //
    //        }
    //
    //    }
    
    //    func emtyMatchView() {
    //        if matchList.count <= 0 {
    //            tableView?.alpha = 0
    //            collectView?.alpha = 0
    //            emptyView.alpha = 1
    //        }else{
    //            DispatchQueue.main.async {
    //                self.emptyView.alpha = 0
    //                self.tableView?.dataSource = self.matchDataSource
    //                self.tableView?.alpha = 1
    //                self.collectView?.alpha = 0
    //                self.tableView?.reloadData()
    //            }
    //
    //        }
    //
    //    }
    
    //    func emtyTeamView() {
    //        if teamList.count <= 0 {
    //            tableView?.alpha = 0
    //            collectView?.alpha = 0
    //            emptyView.alpha = 1
    //        }else{
    //            self.emptyView.alpha = 0
    //            //self.collectView?.dataSource = self
    //            self.tableView?.alpha = 0
    //            self.collectView?.alpha = 1
    //        }
    //    }
}


