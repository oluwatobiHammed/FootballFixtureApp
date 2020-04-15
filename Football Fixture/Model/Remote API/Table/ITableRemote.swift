//
//  ITableRemote.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ITableRemote {
       func getTable(competitionId: Int) -> Observable<ApiResponse<StandingsResult>>
        func getMatch(competitionId: Int, matchDay: Int) -> Observable<ApiResponse<MatchResults>>
    func getTeam(competitionId: Int) -> Observable<ApiResponse<TeamResults>>
}
