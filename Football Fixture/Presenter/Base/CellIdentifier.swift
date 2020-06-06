//
//  CellIdentifier.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi on 01/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
public enum CellIdentifier: Int {
    case customMessageCell
    case CompetitionTableViewCell
    case totalCell
    
    var reuseIdentifier: String {
          switch self {
          case .customMessageCell:
              return "customMessageCell"
          case .CompetitionTableViewCell:
              return "CompetitionTableViewCell"
          case .totalCell:
              return "totalCell"
          }
    }
}


