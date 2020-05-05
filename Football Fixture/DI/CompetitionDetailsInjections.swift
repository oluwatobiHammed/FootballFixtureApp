//
//  CompetitionDetailsInjections.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class CompetitionDetailsInjections {
    static func setup(container: Container) {
        container.register(ITableRemote.self) { _ in TableRemoteImpl(config: .default) }
    container.register(ICompetitionDetailsViewModel.self) { res in
        CompetitionDetailsViewModel(tableRespon: res.resolve(ITableRemote.self)!)
          }

        container.storyboardInitCompleted(CompetitionDetailsTableViewPresenter.self) { res, cntrl in
            cntrl.totalViewModel = res.resolve(ICompetitionDetailsViewModel.self)
              }
    }
}
