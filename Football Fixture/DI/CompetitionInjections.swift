//
//  CompetitionInjections.swift
//  Football Fixture
//
//  Created by user on 09/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class CompetitionInjections {
    static func setup(container: Container) {
    container.register(ICompetitionsLocal.self) { _ in CompetitionLocalImpl() }
    container.register(ICompetitionsRemote.self) { _ in CompetitionRemoteImpl() }
    container.register(ICompetitionRepo.self) { res in
        CompetitionRepoImpl(competitionRemote: res.resolve(ICompetitionsRemote.self)!, competitionLocal: res.resolve(ICompetitionsLocal.self)!)
          }
        container.register(ICompetitonViewModel.self) { res in
            CompetitionViewModel(competitionRepo: res.resolve(ICompetitionRepo.self)!)
        }

        
        
        container.storyboardInitCompleted(CompetitionViewController.self) { res, cntrl in
            cntrl.competitionViewModel = res.resolve(ICompetitonViewModel.self)
              }
    }
}
