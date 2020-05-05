//
//  ViewControllerPresentRequest.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift


public class ViewControllerPresentRequest {
    public var mode: ViewControllerPresentationMode
    public var viewController: UIViewController
    public var presenter: UIViewController?
    public var requestData: Any?
    public var requestDataToo: Any?
    public var didPresentSubject = PublishSubject<Bool>()
    public var didRemoveSubject = PublishSubject<Any?>()
    
    var didPresent: Observable<Bool> {
        return didPresentSubject.asObservable()
    }
    
    var didRemove: Observable<Any?> {
        return didRemoveSubject.asObservable()
    }
    
    public init(mode: ViewControllerPresentationMode, viewController: UIViewController) {
        self.mode = mode
        self.viewController = viewController
    }
    
    deinit {
        print("Destroying ViewControllerPresentRequest")
    }
    
}
