//
//  OneTeamDetailsPresenter.swift
//  Football Fixture
//
//  Created by user on 01/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
import TableViewReloadAnimation
import RxSwift
import RxCocoa

class SquadViewController: BaseTableViewController {
    //var squad: Teams?
    var squadViewModel :ISquadViewModel?
    @IBOutlet weak var navBarTitle: UINavigationBar!
    @IBOutlet weak var crestImage: UIImageView!
    @IBOutlet weak var crestImage1: UIImageView!
    override var presentRequestData: Any?{
        didSet {
            
        }
    }
    
    
    override func getViewModel() -> BaseViewModel {
        return self.squadViewModel as! BaseViewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpImage()
        cellID = "squadcell"
        squadViewModel?.viewDidLoad1()
        
    }
    
    func setUpImage(){
        let squad = presentRequestData as! Teams
        self.navigationItem.title = squad.name
        if let teamCrest = squad.crestUrl {
            //crestImage.converUrlToImage(url: teamCrest)
            //crestImage.converUrlToSvgImage(url: teamCrest)
        }
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func doLoadData(callback: @escaping (([Any]) -> Void)) {
        let squad = presentRequestData as! Teams
        squadViewModel?.squadRespond(ID: squad.id)
        squadViewModel?.squadResponse.subscribe({ (squad) in
            if let squads =  squad.element {
                callback(squads)
            }
        }).disposed(by: disposeBag)
    }
    
    
}




