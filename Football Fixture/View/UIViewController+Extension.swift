//
//  UIViewController+Extension.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public protocol ScrollOnlyOnKeyboardResponderDelegate {
    func getScrollView()-> UIScrollView?
    func shouldDisableScrollingOnKeyboardDismiss()-> Bool
}

var KEYBOARD_IS_SHOWN = false
var KEYBOARD_TAP_GESTURE: UITapGestureRecognizer?
var OLD_KEYBOARD_TAP_GESTURE: UITapGestureRecognizer?

@objc public protocol ChildControllerRemovedDelegate {
    @objc optional func willRemoveChildController(controller: UIViewController)
    @objc optional func didRemoveChildController(controller: UIViewController)
}

public protocol OnScreenKeyboardOffsetProvider {
    func offsetScreenOnKeyboardBy()-> CGFloat?
}

extension UIViewController {
    public func getNavigationViewController()-> UINavigationController? {
        if let navController = self.parent as? UINavigationController {
            return navController
        }
        return nil
    }
    
    public func displayViewController(fromRequest: ViewControllerPresentRequest) {
        
        if var disappearSubject = fromRequest.viewController as? ViewControllerPresentedDidDisappear {
            disappearSubject.didRemoveViewControllerSubject = fromRequest.didRemoveSubject
        }
        
        if var requestSetter = fromRequest.viewController as? ViewControllerPresentRequestDataReceiver {
            requestSetter.presentRequestData = fromRequest.requestData
            requestSetter.presentRequestDataToo = fromRequest.requestDataToo
        }
        switch fromRequest.mode {
        case .modal:
            fromRequest.viewController.modalPresentationStyle = .overCurrentContext
            self.present(fromRequest.viewController, animated: true, completion: nil)
        case .presentForce:
            self.present(fromRequest.viewController, animated: true, completion: nil)
        case .present:
            if let navController = self.navigationController {
                navController.pushViewController(fromRequest.viewController, animated: true)
            }
            else{
                self.present(fromRequest.viewController, animated: true, completion: nil)
            }
        case .root:
            let _ = UINavigationProvider.makeAsRoot(using: fromRequest.viewController)
        case .addToParent:
            self.addToParent(fromRequest.viewController)
        }
        fromRequest.didPresentSubject.onNext(true)
    }
    
    public func addToParent(_ child: UIViewController, slideFrom: SlideDirection? = nil, duration: TimeInterval = 0.5, completion: EmptyCallback? = nil) {
        let childView = child.view
        
        if let slideFrom = slideFrom {
            switch slideFrom {
            case .top:
                childView?.frame.origin.y = 0.0 - self.view.frame.height
            case .bottom:
                childView?.frame.origin.y = self.view.frame.height
            case .left:
                childView?.frame.origin.x = 0.0 - self.view.frame.width
            case .right:
                childView?.frame.origin.x = self.view.frame.width
            }
        }
        else {
            childView?.alpha = 0
        }
        
        addChild(child)
        self.view.addSubview(child.view)
        
        
        UIView.animate(withDuration: duration, animations: {
            if let slideFrom = slideFrom {
                switch slideFrom {
                case .top:
                    childView?.frame.origin.y = 0
                case .bottom:
                    childView?.frame.origin.y = 0
                case .left:
                    childView?.frame.origin.x = 0
                case .right:
                    childView?.frame.origin.x = 0
                }
            }
            else {
                childView?.alpha = 1
            }
        }){ (completed: Bool) in
            child.didMove(toParent: self)
            if let completion = completion {
                completion()
            }
        }
    }
    
    public func removeFromParentViewController(slideTowards: SlideDirection? = .bottom, duration: TimeInterval = 0.5, completion: EmptyCallback? = nil) {
        guard parent != nil else {
            return
        }
        
        let parentView = parent!.view!
        
        willMove(toParent: nil)
        
        let parentController = self.parent as? ChildControllerRemovedDelegate
        if let parent = parentController {
            parent.willRemoveChildController?(controller: self)
        }
        UIView.animate(withDuration: 1, animations: {
            
            if let slideTowards = slideTowards {
                switch slideTowards {
                case .top:
                    self.view.frame.origin.y = 0.0 - parentView.frame.height
                case .bottom:
                    self.view.frame.origin.y = parentView.frame.height
                case .left:
                    self.view.frame.origin.x = 0.0 - parentView.frame.width
                case .right:
                    self.view.frame.origin.x = parentView.frame.width
                }
            }
            else {
                self.view.alpha = 0
            }
            
        }){ (completed: Bool) in
            
            self.removeFromParent()
            self.view.removeFromSuperview()
            if let parent = parentController {
                parent.didRemoveChildController?(controller: self)
            }
        }
    }
    
    func onRemovingFromParent() {
        if var invoker = self as? ViewControllerPresentedDidDisappear {
            invoker.didRemoveViewControllerSubject?.onNext(invoker.viewControllerWillDisappearData)
            invoker.didRemoveViewControllerSubject?.onCompleted()
            invoker.didRemoveViewControllerSubject = nil
        }
    }
}
