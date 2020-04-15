//
//  SquadInjections.swift
//  Football Fixture
//
//  Created by user on 13/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class SquadInjections {
    static func setup(container: Container) {
        container.register(ISquadRemote.self) { _ in SquadRemoteImpl(config: .default) }
    container.register(ISquadViewModel.self) { res in
        SquadViewModel(squadRespo: res.resolve(ISquadRemote.self)!)
          }
        
        container.storyboardInitCompleted(SquadViewController.self) { res, cntrl in
            cntrl.squadViewModel = res.resolve(ISquadViewModel.self)
              }
        
    }
}
