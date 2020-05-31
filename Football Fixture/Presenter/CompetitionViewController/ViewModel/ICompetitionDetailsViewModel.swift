//
//  ITotalTableViewModel.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ICompetitionDetailsViewModel {
    var tableResponse: PublishSubject<[standings]> { get }
    var fixtureResponse: PublishSubject<[FixtureSection]> { get }
    var teamResponse: PublishSubject<[Teams]> { get }
    var dataExist: PublishSubject<Bool> { get }
    func viewDidLoad1()
    func updateTable(getID competitionID: Int)
    func updateTeam(getID competitionID: Int)
    func fixtureRespond(getID competitionID: Int)
}
