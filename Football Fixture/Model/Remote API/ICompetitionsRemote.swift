//
//  ICompetitionsRemote.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ICompetitionsRemote {
    func getCompetition() -> Observable<ApiResponse<CompetitionResults>>
}
