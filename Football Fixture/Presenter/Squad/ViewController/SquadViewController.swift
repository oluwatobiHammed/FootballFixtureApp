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
import SVGKit

class SquadViewController: BaseViewController {
    var squad: Teams?
    var squadViewModel :ISquadViewModel?
    @IBOutlet weak var teamTableView: UITableView!
    @IBOutlet weak var navBarTitle: UINavigationBar!
    @IBOutlet weak var crestImage: UIImageView!
    @IBOutlet weak var crestImage1: UIImageView!
    
    
    
    override func getViewModel() -> BaseViewModel {
        return self.squadViewModel as! BaseViewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = squad?.name
        setUpImage()
        bindViews()
        squadViewModel?.viewDidLoad1()
        squadViewModel?.squadRespond(ID: squad!.id)
        self.teamTableView.reloadData(  with: .simple(duration: 0.75, direction: .rotation3D(type: .ironMan),constantDelay: 0))
        teamTableView.reloadData()
    }
    
    func setUpImage(){
        if let teamCrest = squad?.crestUrl {
            if teamCrest.contains(".svg") {
                
                if let crestPath = URL(string: teamCrest) {
                    
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: crestPath)
                        if let data = data {
                            if  let image: SVGKImage = SVGKImage(data: data){
                                DispatchQueue.main.async {
                                    self.crestImage.image = image.uiImage
                                }
                            }
                            
                        }
                        
                    }
                }
            } else if  teamCrest.contains(".png") {
                
                if let crestPath = URL(string: teamCrest) {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: crestPath)
                        if let data = data {
                            if  let image: UIImage = UIImage(data: data){
                                DispatchQueue.main.async {
                                    self.crestImage1.image = image
                                    
                                }
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func bindViews() {
        squadViewModel?.squadResponse.bind(to: self.teamTableView.rx.items) { (tableView, index, element) in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "oneteamcell") as? SquadTableViewCell
            
            cell?.numberingLabel.text = "\(String((index) + 1))."
            cell?.oneTeam = element
            return cell!
        }.disposed(by: disposeBag)
        
    }
}




