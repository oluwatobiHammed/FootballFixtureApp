//
//  IToday'sFixturesViewModel.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ITodaysFixturesViewModel {
    var matchResponse: PublishSubject<[Match]> { get }
    func viewDidLoad1()
    func matchRespond()
}
