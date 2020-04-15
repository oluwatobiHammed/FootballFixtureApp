//
//  Injections.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    public static func setup() {
        TodayMatchInjections.setup(container: defaultContainer)
        CompetitionInjections.setup(container: defaultContainer)
        CompetitionDetailsInjections.setup(container: defaultContainer)
        //TeamInjections.setup(container: defaultContainer)
        SquadInjections.setup(container: defaultContainer)
    }
}
