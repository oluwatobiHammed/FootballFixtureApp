//
//  ViewControllerPresentationUtility.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 04/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


public protocol ViewControllerPresentationSharingUtility {
    
    var sharingDisposeBag: DisposeBag? {get}
    var shareHandlingViewControllerInstance: UIViewController? {get}
    
    func setShareDisposeable(disposable: Disposable?)
    func clearSharingDisposeBag()
}


public protocol ViewControllerPresentationUtility: ViewControllerPresentRequestDataReceiver, ViewControllerPresentedDidDisappear {
    var acceptPresentationRequest: Bool {get}
    var presentationDisposeBag: DisposeBag? {get}
    var presentingViewControllerInstance: UIViewController? {get}
    
    func setViewControllerPresenterDisposable(disposable: Disposable?)
    func clearPresentationDisposeBag()
    
}

extension ViewControllerPresentationUtility {
    public func logicViewControllerWillDisappear() {
        setViewControllerPresenterDisposable(disposable: nil)
        if let controller = presentingViewControllerInstance {
            if controller.isMovingFromParent {
                controller.onRemovingFromParent()
                self.clearPresentationDisposeBag()
            }
        }
    }
    
    public func logicViewControllerWillAppear() {
        
        if self.acceptPresentationRequest {
            setViewControllerPresenterDisposable(disposable: nil)
            let disposable = ViewControllerPresenter.shared.presentViewControllerObserver.subscribe(onNext: { (request) in
                self.presentingViewControllerInstance?.displayViewController(fromRequest: request)
            })
            if let bag = self.presentationDisposeBag {
                disposable.disposed(by: bag)
            }
            self.setViewControllerPresenterDisposable(disposable: disposable)
        }
    }
}
