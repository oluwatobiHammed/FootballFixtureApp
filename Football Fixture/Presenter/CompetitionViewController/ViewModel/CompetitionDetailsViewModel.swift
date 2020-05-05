//
//  TotalTableViewModel.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CompetitionDetailsViewModel: BaseViewModel, ICompetitionDetailsViewModel {
    var teamResponse: PublishSubject<[Teams]> = PublishSubject()
    var fixtureResponse: PublishSubject<[Match]> = PublishSubject()
    var tableResponse: PublishSubject<[standings]> = PublishSubject()
    var dataExist: PublishSubject<Bool> = PublishSubject()
    let tableRespon: ITableRemote
    
    init(tableRespon: ITableRemote) {
        self.tableRespon = tableRespon
    }
    
    func viewDidLoad1() {
    }
    
    func updateTable(getID competitionID: Int)  {
        
        self.tableRespond(getID: competitionID)
        
    }
    func tableRespond(getID competitionID: Int) {
        
        self.isLoading.onNext(true)
        tableRespon.getTable(competitionId: competitionID)
            .subscribe(onNext: { [weak self] res in
                self?.isLoading.onNext(false)
                if let res = res.data?.standings {
                    
                    self?.tableResponse.onNext(res)
                }
                else if let apiErr = res.error {
                    self?.apiError.onNext(apiErr)
                }
                },
                       onError: { [weak self] error in
                        self?.isLoading.onNext(false)
                        self?.throwableError.onNext(error)
            }).disposed(by: disposeBag)
    }
    
    func fixtureRespond(getID competitionID: Int, getMD matchDay: Int) {
        self.isLoading.onNext(true)
        tableRespon.getMatch(competitionId: competitionID, matchDay: matchDay).subscribe(onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let res = res.data?.results {
                self?.fixtureResponse.onNext(res)
            }
            else if let apiErr = res.error {
                self?.apiError.onNext(apiErr)
            }
            },
                                                                                         onError: { [weak self] error in
                                                                                            self?.isLoading.onNext(false)
                                                                                            self?.throwableError.onNext(error)
        }).disposed(by: disposeBag)
    }
    
    func updateTeam(getID competitionID: Int) {
        self.isLoading.onNext(true)
        tableRespon.getTeam(competitionId: competitionID).subscribe(onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let res = res.data?.results {
                self?.teamResponse.onNext(res)
                self?.dataExist.onNext(res.count > 0)
            }
            else if let apiErr = res.error {
                self?.apiError.onNext(apiErr)
            }
            },
                                                                    onError: { [weak self] error in
                                                                        self?.isLoading.onNext(false)
                                                                        self?.throwableError.onNext(error)
        }).disposed(by: disposeBag)
    }
}
