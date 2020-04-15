//
//  Today'sFixturesViewModel.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TodaysFixturesViewModel: BaseViewModel, ITodaysFixturesViewModel {
    
    var matchResponse: PublishSubject<[Match]> = PublishSubject()
    let matchRespo: IMatchesRemote
    
    init(matchRespo: IMatchesRemote) {
        self.matchRespo = matchRespo
    }
    
    func viewDidLoad1() {
    }
    
    func matchRespond() {
        self.isLoading.onNext(true)
        matchRespo.getMatch().subscribe(onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let res = res.data?.results {
                self?.matchResponse.onNext(res)
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
