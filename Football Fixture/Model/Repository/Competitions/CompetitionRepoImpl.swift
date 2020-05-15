//
//  CompetitionRepoImpl.swift
//  Football Fixture
//
//  Created by user on 14/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift


struct CompetitionRepoImpl: ICompetitionRepo {
 
    let competitionRemote: ICompetitionsRemote?
    let competitionLocal: ICompetitionsLocal?
    public init(competitionRemote: ICompetitionsRemote, competitionLocal: ICompetitionsLocal) {
        self.competitionRemote = competitionRemote
        self.competitionLocal = competitionLocal
    }
    func getCompetition() -> Observable<ApiResponse<CompetitionResults>> {
         competitionRemote!.getCompetition()
     }
     
     func saveCompetitionsDetails(competitions: competition) {
         //competitionLocal!.saveCompetitionsDetails(competitions: competitions)
     }

}
