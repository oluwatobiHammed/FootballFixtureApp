//
//  IBaseRemoteApi.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol IBaseRemoteApi {
    //MARK: function for URLSession takes
    func makeAPIRequestObservable<T: Codable>(responseType: T.Type, url: URL, method: Method,params: [String : String]?) -> Observable<T>

}
