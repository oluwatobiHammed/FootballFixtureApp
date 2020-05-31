//
//  BaseTableViewController.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class BaseTableViewController: FootBallFixtureBaseViewController {
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var collectionView: UICollectionView?
    let rc = UIRefreshControl()
    
    var itemsToRender: [Any] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    var cellID = "cellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        prepareCollectionView()
    }
    
    func prepareTableView(){
        rc.tintColor = .systemBlue
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.doLoadData(callback: self.onNewDataLoaded)
    }
    
    func prepareCollectionView() {
        let itemsize = UIScreen.main.bounds.width/3.5 - 2.5
        let layOut = UICollectionViewFlowLayout()
        layOut.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 10, right: 2)
        layOut.itemSize = CGSize(width: itemsize, height: itemsize)
        layOut.minimumInteritemSpacing = 2
        layOut.minimumLineSpacing = 2
        collectionView?.collectionViewLayout = layOut
    }
    
    @objc func handleRefresh() {
        tableView?.refreshControl?.endRefreshing()
        //collectView?.refreshControl?.endRefreshing()
    }
    func doLoadData(callback: @escaping ((_ loadedData: [Any])-> Void)) {
        
    }
    fileprivate func onNewDataLoaded(result: [Any]) {
       self.itemsToRender.removeAll()
        self.itemsToRender.append(contentsOf: result)
        //print(result)
        
    }
    func sendId(selectedIndex: Int) {
    }
    func updateContentOfCell(cell: UITableViewCell, data: Any) {
        
    }
}
