//
//  GetMatchImpl.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MatchImplRemoteImpl: IMatchesRemote {
//        static var shared = MatchImplRemoteImpl()
        lazy var requestObservable = BaseRemoteApiImpl(config: .default)
        func getMatch() -> Observable<ApiResponse<MatchResults>> {
            return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<MatchResults>.self, url:RemoteApiConstants.Endpoints.getMatches.url, method: .Get, params: [:])
        }
    
}
