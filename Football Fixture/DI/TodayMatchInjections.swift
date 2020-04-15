//
//  TodayMatchInjections.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class TodayMatchInjections {
    static func setup(container: Container) {
    container.register(IMatchesRemote.self) { _ in MatchImplRemoteImpl() }
    container.register(ITodaysFixturesViewModel.self) { res in
        TodaysFixturesViewModel(matchRespo: res.resolve(IMatchesRemote.self)!)
          }
        
        container.storyboardInitCompleted(TodaysFixturesPresenter.self) { res, cntrl in
            cntrl.todaysFixturesViewModel = res.resolve(ITodaysFixturesViewModel.self)
              }
        
    }
}
