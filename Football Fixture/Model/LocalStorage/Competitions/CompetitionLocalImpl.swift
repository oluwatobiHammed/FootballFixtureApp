//
//  CompetitionLocalImpl.swift
//  Football Fixture
//
//  Created by user on 14/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

public class CompetitionLocalImpl: ICompetitionsLocal {
    public init() { }
    
    fileprivate let realm = try! Realm()
    
    func saveCompetitionsDetails(competitions: competition) {
        
    let compit = realm.objects(competition.self).sorted(byKeyPath: "updatedAt", ascending: false)
                try! realm.write {
                    if queryExists(query: competitions, in: compit.toArray()) {
                        
                               } else {
                                   realm.add(competitions)
                               }
        }
    }
    private func queryExists(query: competition, in list: [competition]) -> Bool {
        return (list.first(where: { $0.id == query.id }) != nil)
      }
    func getDestinationHistory() -> Observable<[competition]?> {
       let histories = realm.objects(competition.self).sorted(byKeyPath: "updatedAt", ascending: false)
       return Observable.just(histories.toArray())
   }
}

extension Results {
    func toArray() -> [Results.Iterator.Element] {
        return map { $0 }
    }
}
