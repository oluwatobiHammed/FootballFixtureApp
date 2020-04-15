//
//  BaseViewModel.swift
//  Football Fixture
//
//  Created by user on 08/04/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let alertValue: PublishSubject<AlertValue> = PublishSubject()
    let apiError: PublishSubject<ApiError> = PublishSubject()
    let throwableError: PublishSubject<Error> = PublishSubject()
    let preLoad: PublishSubject<PreLoader> = PublishSubject()
    
    func viewDidLoad() { }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
    
}
