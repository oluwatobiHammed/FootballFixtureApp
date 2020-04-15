//
//  IFixturesViewModel.swift
//  Football Fixture
//
//  Created by user on 10/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol IFixturesViewModel {
    var fixtureResponse: PublishSubject<[Match]> { get }
    func viewDidLoad1()
    func fixtureRespond(getID competitionID: Int, getMD matchDay: Int)
}
