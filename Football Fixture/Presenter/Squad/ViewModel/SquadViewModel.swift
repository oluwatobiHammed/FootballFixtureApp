//
//  CompetitionListViewModel.swift
//  Football Fixture
//
//  Created by user on 05/03/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SquadViewModel: BaseViewModel, ISquadViewModel {
    var squadResponse: PublishSubject<[squad]> = PublishSubject()
    let squadRespo: ISquadRemote
    
    init(squadRespo: ISquadRemote) {
        self.squadRespo = squadRespo
    }
    
    func viewDidLoad1() {
    }
    
    func squadRespond(ID: Int) {
        self.isLoading.onNext(true)
        squadRespo.getSquad(teamId: ID).subscribe(onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let res = res.data?.squad {
                self?.squadResponse.onNext(res)
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
