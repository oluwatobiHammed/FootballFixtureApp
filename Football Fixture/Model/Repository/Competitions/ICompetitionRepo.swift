//
//  ICompetitionRepo.swift
//  Football Fixture
//
//  Created by user on 14/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ICompetitionRepo {
  func getCompetition() -> Observable<ApiResponse<CompetitionResults>>
  func saveCompetitionsDetails(competitions: competition)
}

