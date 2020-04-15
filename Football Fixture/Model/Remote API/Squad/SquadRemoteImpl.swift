//
//  SquadImpl.swift
//  Football Fixture
//
//  Created by user on 05/02/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SquadRemoteImpl: BaseRemoteApiImpl, ISquadRemote {
    
    static var shared = SquadRemoteImpl(config: .default)
           lazy var requestObservable = BaseRemoteApiImpl(config: .default)
           func getSquad(teamId: Int) -> Observable<ApiResponse<OneTeam>> {
            return requestObservable.makeAPIRequestObservable(responseType:ApiResponse <OneTeam>.self, url:RemoteApiConstants.Endpoints.getOneTeam(teamId).url, method: .Get, params: [:])
           }
}
