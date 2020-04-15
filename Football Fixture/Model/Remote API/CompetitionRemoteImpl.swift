//
//  CompetitionImpl.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class CompetitionRemoteImpl:  ICompetitionsRemote {
    lazy var requestObservable = BaseRemoteApiImpl(config: .default)
       func getCompetition() -> Observable<ApiResponse<CompetitionResults>> {
        return requestObservable.makeAPIRequestObservable(responseType:ApiResponse< CompetitionResults>.self, url: RemoteApiConstants.Endpoints.getCompetitions.url, method: .Get, params: [:])
       }
    
    
}
