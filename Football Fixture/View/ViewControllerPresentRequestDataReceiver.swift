//
//  ViewControllerPresentRequestDataReceiver.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

public protocol ViewControllerPresentRequestDataReceiver {
    var presentRequestData: Any? {get set}
    var presentRequestDataToo: Any? {get set}
}

public protocol ViewControllerPresentedDidDisappear {
    var viewControllerWillDisappearData: Any? {get set}
    var didRemoveViewControllerSubject: PublishSubject<Any?>? {get set}
}

public enum ViewControllerPresentationMode{
    case present
    case presentForce
    case modal
    case addToParent
    case root
}

public enum SlideDirection {
    case left
    case right
    case top
    case bottom
}

public class ViewControllerPresenter {
    fileprivate var requestSubject = PublishSubject<ViewControllerPresentRequest>()
    
    public static let shared = ViewControllerPresenter()
    
    var presentViewControllerObserver: Observable<ViewControllerPresentRequest> {
        return requestSubject.asObserver()
    }
    
    fileprivate init() {}
    
    public func  presentViewController(request: ViewControllerPresentRequest) {
        if let presenter = request.presenter {
            presenter.displayViewController(fromRequest: request)
        }
        else {
            self.requestSubject.onNext(request)
        }
    }
    
}
