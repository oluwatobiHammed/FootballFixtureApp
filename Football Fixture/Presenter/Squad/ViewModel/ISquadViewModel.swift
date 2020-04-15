//
//  ISquadViewModel.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ISquadViewModel {
    var squadResponse: PublishSubject<[squad]> { get }
    func viewDidLoad1()
    func squadRespond(ID: Int)
}
