//
//  TeamImpl.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TeamRemoteImpl: ITeamImpRemote {
    static var shared = TableRemoteImpl(config: .default)
          lazy var requestObservable = BaseRemoteApiImpl(config: .default)
          func getTeam(competitionId: Int) -> Observable<ApiResponse<TeamResults>> {
            return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<TeamResults>.self, url:RemoteApiConstants.Endpoints.getTeam(competitionId).url, method: .Get, params: [:])
          }

}

