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
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var segmentedView: UIView!
    var matchDataSource: MatchesDataSource?
    var teamDataSource: TeamDataSource?
    
    var teamList: [Teams] = []
    var data: Competition?
    override var presentRequestData: Any? {
        didSet {
            data = presentRequestData as? Competition
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
        noDataAlert = CustomNoDataAlert.init(on: emptyView)
        refreshData()
        totalViewModel?.viewDidLoad1()
    }
    
    func showNoDataAlert(title: String, message: String, messageImage: UIImage) {
        self.noDataAlert?.setEmptyView(title: title, message: message, messageImage: messageImage)
    }
    
    override func doLoadData(callback: @escaping (([Any]) -> Void)) {
        
        totalViewModel?.tableResponse.bind(onNext: {(standing) in
            if standing.isEmpty {
                print("It is empty")
            }else{
                if let tables = standing[0].table{
                    callback(tables)
                }else {
                    print("No data here")
                }
            }
            
        }).disposed(by: disposeBag)
        
        totalViewModel?.fixtureRespond(getID:data!.id)
        totalViewModel?.updateTeam(getID:data!.id)
        totalViewModel?.updateTable(getID: data!.id)
        
        
    }
    
    
    private func refreshData() {
        totalViewModel?.fixtureResponse.subscribe({ [weak self] (match) in
            if let matches = match.element {
                self?.matchDataSource = MatchesDataSource(sections: matches)
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
        default:
            break
        }
    }
    
    
}


