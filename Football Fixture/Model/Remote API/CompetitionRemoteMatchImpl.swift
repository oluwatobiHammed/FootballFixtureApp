//
//  CompetitionMatchImpl.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CompetitionRemoteMatchImpl: BaseRemoteApiImpl, ICompetitionMatchRemote {
    var requestID: competition?
    static var shared = CompetitionRemoteMatchImpl(config: .default)
       lazy var requestObservable = BaseRemoteApiImpl(config: .default)
       func getMatch(competitionId: Int, matchDay: Int) -> Observable<ApiResponse<MatchResults>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<MatchResults>.self, url:RemoteApiConstants.Endpoints.getCompetitionMatches(competitionId).url, method: .Get, params: [:])
       }
}
