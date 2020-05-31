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
    
    
    var competitionResponse: PublishSubject<[Competition]> = PublishSubject()
    let competitionRepo: ICompetitionRepo
    
    init(competitionRepo: ICompetitionRepo) {
        self.competitionRepo = competitionRepo
    }
    
    func viewDidLoad1() {
    }
    
    
    func competitionRespond() {
        var competitionArray = [Competition]()
        self.isLoading.onNext(true)
        competitionRepo.getCompetition().subscribe(onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let res = res.data?.results {
                let id = [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
                for  id in id {
                    for item in res{
                        if item.id == id {
                            let tierOneCompetition = Competition()
                            if let season = item.currentSeason?.season, let name = item.competitionName, let id = item.id {
                                tierOneCompetition.competitionName = name
                                tierOneCompetition.id = id
                                tierOneCompetition.Season = season
                            }
                            
                            competitionArray.append(tierOneCompetition)
                            
                        }
                    }
                }
                self?.competitionResponse.onNext(competitionArray)
                
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
