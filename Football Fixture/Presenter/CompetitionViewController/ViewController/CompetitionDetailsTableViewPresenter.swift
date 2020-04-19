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

struct CompetitionVC {
    static var currentCompetition: competition?
}

class CompetitionDetailsTableViewPresenter: BaseViewController, UITableViewDataSource {
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamCollectionView: UICollectionView!
    var  totalViewModel: ITotalTableViewModel?
    var refreshControl: UIRefreshControl?
    @IBOutlet weak var segmentedView: UIView!
    
    var matchDataSource: FixturesDetails?
    var matchList: [Match] = []
    let titles = "Table ,Fixtures, Team"
    var competit: competition?
    var teamList = [Teams]()
    var tableList = [table]()
    fileprivate var alert: CustomAlert?
    var segmentedControl: CustomSegmentedContrl!
    
    override func getViewModel() -> BaseViewModel {
        return self.totalViewModel as! BaseViewModel
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setEmptyView(title: "No Table is avaliable for this competition", message: "Avaliable Table will show here", messageImage: #imageLiteral(resourceName: "swipe-right (1)"))
            emtyTableView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ssss()
        refreshData()
        tableView.dataSource = self
        teamCollectionView.dataSource = self
        teamCollectionView.delegate = self
        tableView.alpha = 0
        teamCollectionView.alpha = 0
        addRefreshControl()
        let itemsize = UIScreen.main.bounds.width/3 - 3
        let layOut = UICollectionViewFlowLayout()
        layOut.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 10, right: 2)
        layOut.itemSize = CGSize(width: itemsize, height: itemsize)
        layOut.minimumInteritemSpacing = 2
        layOut.minimumLineSpacing = 2
        teamCollectionView.collectionViewLayout = layOut
        totalViewModel?.viewDidLoad1()
        tableView.reloadData()
        
        totalViewModel?.dataExist.bind(onNext: { (val) in
            if val {
                self.tableView.restore()
                self.teamCollectionView.restore()
            }else{
                self.tableView.setEmptyMessage("No Data is Avaliable for this competition")
                self.teamCollectionView.setEmptyMessage("No Data is Avaliable for this competition")
            }
        }).disposed(by: disposeBag)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .red
        refreshControl?.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    @objc func handleRefreshAction() {
        refreshData()
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    private func refreshData() {
        if let competition = competit {
            if let id = competition.id {
                totalViewModel?.updateTable(getID: id)
                totalViewModel?.updateTeam(getID: competition.id!)
                if let md = competition.currentSeason?.currentMatchday{
                    totalViewModel?.fixtureRespond(getID:id, getMD: md)
                }
            }
            
        }
        
        
        totalViewModel?.tableResponse.bind(onNext: { [weak self] (standing) in
            if let tables = standing[0].table{
                DispatchQueue.main.async {
                    self?.tableList = tables
                    self?.emptyView.alpha = 0
                    self?.tableView.reloadData()
                }
            }
            
            
        }).disposed(by: disposeBag)
        
        totalViewModel?.fixtureResponse.subscribe({ (match) in
            if let matches = match.element {
                self.matchDataSource = FixturesDetails(matchesList: matches)
                self.matchList = match.element!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }).disposed(by: disposeBag)
        
        
        totalViewModel?.teamResponse.subscribe({ (team) in
            if let teams = team.element {
                self.teamList = teams
                DispatchQueue.main.async {
                    self.teamCollectionView.reloadData()
                }
            }
            
        }).disposed(by: disposeBag)
        
    }
    //    private func refreshTableIfNeeded(_ newMatch: [Match]) {
    //         guard matchList != newMatch else {
    //             return
    //         }
    //
    //        matchList = newMatch
    //        matchDataSource?.matchesList = newMatch
    //        tableView.reloadData()
    //    }
    func sendId( _ selectedIndex: IndexPath) {
        let team = teamList[selectedIndex.row]
        let   vc = self.storyboard!.instantiateViewController(withIdentifier: "squadVC") as? SquadViewController
        vc?.squad = team
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableList.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "totalCell")! as? TeamsTableViewCell
        
        let table =  tableList[indexPath.row]
        cell?.table = table
        cell?.selectionStyle = .none
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        
        if #available(iOS 13.0, *) {
            label.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        label.font = .boldSystemFont(ofSize: 12)
        if section == 0{
            label.text = "    #                  TEAM                                                              PTS    P     GD        "
        }
        
        return label
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

extension CompetitionDetailsTableViewPresenter: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamcell", for: indexPath) as? TeamsCollectionViewCell
        let team =  teamList[indexPath.row]
        cell?.team = team
        cell?.addTapGesture {
            print("Cell Pressed")
            self.sendId(indexPath)
        }
        
        return cell!
    }
}

extension CompetitionDetailsTableViewPresenter{
    
    @objc func onChangeOfSegment(_ sender: CustomSegmentedContrl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            emtyTableView()
        case 1:
            emtyMatchView()
        case 2:
            emtyTeamView()
        default:
            break
        }
        
        
    }
    
    func emtyTableView() {
        
        if tableList.count <= 0 {
            tableView.alpha = 0
            emptyView.alpha = 1
   
         }else{
            DispatchQueue.main.async {
                self.emptyView.alpha = 0
                self.tableView.dataSource = self
                self.tableView.alpha = 1
                self.teamCollectionView.alpha = 0
                self.tableView.reloadData()
            }
        
         }
        
    }
    
    func emtyMatchView() {
         
         if matchList.count <= 0 {
             tableView.alpha = 0
             emptyView.alpha = 1
          }else{
             DispatchQueue.main.async {
                 self.emptyView.alpha = 0
                 self.tableView.dataSource = self.matchDataSource
                 self.tableView.alpha = 1
                 self.teamCollectionView.alpha = 0
                 self.tableView.reloadData()
             }
         
          }
         
     }
    
    func emtyTeamView() {
         
         if teamList.count <= 0 {
             tableView.alpha = 0
             teamCollectionView.alpha = 0
             emptyView.alpha = 1
          }else{
             DispatchQueue.main.async {
                 self.emptyView.alpha = 0
                 self.tableView.alpha = 0
                 self.teamCollectionView.alpha = 1
                 self.teamCollectionView.reloadData()
             }
         
          }
         
     }
    
        func setEmptyView(title: String, message: String, messageImage: UIImage) {
           
            let messageImageView = UIImageView()
            let titleLabel = UILabel()
            let messageLabel = UILabel()
    
            messageImageView.backgroundColor = .clear
    
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            messageImageView.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
    
            titleLabel.textColor = UIColor.black
            titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
    
            messageLabel.textColor = UIColor.lightGray
            messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
    
            emptyView.addSubview(titleLabel)
            emptyView.addSubview(messageImageView)
            emptyView.addSubview(messageLabel)
    
            messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
            messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
            messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
            titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
    
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
            messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
    
            messageImageView.image = messageImage
            titleLabel.text = title
            messageLabel.text = message
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
    
            UIView.animate(withDuration: 1, animations: {
    
                messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
            }, completion: { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
                }, completion: { (finishh) in
                    UIView.animate(withDuration: 1, animations: {
                        messageImageView.transform = CGAffineTransform.identity
                    })
                })
    
            })
    
        }
    
    
    
}


extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .lightGray
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        DispatchQueue.main.async {
            self.backgroundView = messageLabel;
        }
    }
    
    func restore() {
        DispatchQueue.main.async {
            self.backgroundView = nil
        }
    }
}
