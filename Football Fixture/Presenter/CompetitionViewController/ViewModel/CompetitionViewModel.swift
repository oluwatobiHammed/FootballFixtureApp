//
//  CompetitionViewModel.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CompetitionViewModel: BaseViewModel,ICompetitonViewModel  {
   
    
    var competitionResponse: PublishSubject<[competition]> = PublishSubject()
    let competitionRepo: ICompetitionRepo
    
    init(competitionRepo: ICompetitionRepo) {
        self.competitionRepo = competitionRepo
    }
    
    func viewDidLoad1() {
    }
    
    
    func competitionRespond() {
        self.isLoading.onNext(true)
        competitionRepo.getCompetition().subscribe(onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let res = res.data?.results {
                self?.competitionResponse.onNext(res)
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
    
    func saveCompetitionsDetails(competitions: competition) {
        competitionRepo.saveCompetitionsDetails(competitions: competitions)
       }
    
}
