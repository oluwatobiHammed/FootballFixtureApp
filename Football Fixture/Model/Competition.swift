//
//  competitionsData.swift
//  Football Fixture
//
//  Created by user on 24/10/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RealmSwift
 // A Realm Object that represents a competition
 class Competition: Object {
     @objc dynamic var id: Int = 0
     @objc dynamic var competitionName: String = ""
     @objc dynamic var Season: String = ""
 }


