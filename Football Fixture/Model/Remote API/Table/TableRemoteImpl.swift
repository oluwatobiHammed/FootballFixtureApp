//
//  TableImpl.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TableRemoteImpl: BaseRemoteApiImpl,ITableRemote {
    
    static var shared = TableRemoteImpl(config: .default)
        lazy var requestObservable = BaseRemoteApiImpl(config: .default)
        func getTable(competitionId: Int) -> Observable<ApiResponse<StandingsResult>> {
            //print("competition ID", competitionId)
            return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<StandingsResult>.self, url:RemoteApiConstants.Endpoints.getTable(competitionId).url, method: .Get, params: [:])
        }
    
    func getMatch(competitionId: Int, matchDay: Int) -> Observable<ApiResponse<MatchResults>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<MatchResults>.self, url:RemoteApiConstants.Endpoints.getCompetitionMatches(competitionId).url, method: .Get, params: [:])
        }
    
    func getTeam(competitionId: Int) -> Observable<ApiResponse<TeamResults>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<TeamResults>.self, url:RemoteApiConstants.Endpoints.getTeam(competitionId).url, method: .Get, params: [:])
         }
}
