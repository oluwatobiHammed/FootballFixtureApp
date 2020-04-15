//
//  FixturesViewModel.swift
//  Football Fixture
//
//  Created by user on 10/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa

class FixturesViewModel: BaseViewModel, IFixturesViewModel {
    var fixtureResponse: PublishSubject<[Match]> = PublishSubject()
    let matchRespon: ICompetitionMatchRemote
    
    init(matchRespon: ICompetitionMatchRemote) {
        self.matchRespon = matchRespon
    }
    
    func viewDidLoad1() {
    }
    func fixtureRespond(getID competitionID: Int, getMD matchDay: Int) {
        self.isLoading.onNext(true)
        matchRespon.getMatch(competitionId: competitionID, matchDay: matchDay).subscribe(onNext: { [weak self] res in
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
    
}
