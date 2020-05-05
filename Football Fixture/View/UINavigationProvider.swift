//
//  UINavigationProvider.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

public typealias StoryboardId = String
public typealias ViewControllerId = String

public typealias EmptyCallback = () -> Void
public typealias BooleanCallback = (_ done: Bool) -> Void
public typealias StringCallback = (_ done: String?) -> Void

extension String {
    public func asStoryboard()-> UINavigationProvider {
        return UINavigationProvider(storyboard: self)
    }
}

public class UINavigationProvider{
    
    fileprivate var storyboard: UIStoryboard!
    
    init(storyboard: StoryboardId) {
        self.storyboard = UIStoryboard(name: storyboard, bundle: nil)
    }
    
    public func initialController()-> UIViewController? {
        return storyboard.instantiateInitialViewController()
    }
    
    public func get(for controllerId: ViewControllerId)-> UIViewController? {
        return self.storyboard.instantiateViewController(withIdentifier: controllerId)
    }
    
    public func makeAsRoot(using: ViewControllerId)-> Bool {
        if let controller = self.get(for: using) {
            return UINavigationProvider.makeAsRoot(using: controller)
        }
        return false
    }
    
    static public func makeAsRoot(using: UIViewController, onWindow: UIWindow? = nil)-> Bool {
        
        if let delegate = UIApplication.shared.delegate {
            var windowToUse: UIWindow? = nil
            if let w = onWindow {
                windowToUse = w
            }
            if #available(iOS 13, *) {
                if let w = (UIApplication.shared.connectedScenes.first?.delegate as? UIWindowSceneDelegate)?.window {
                    windowToUse = w
                }
            }
            
            if let window = windowToUse {
                window.rootViewController = using
                return true
            }
            else if let window = delegate.window {
                window?.rootViewController = using
                return true
            }
        }
        return false
    }
    
    public func navigate(to: ViewControllerId, from: UIViewController, asRoot: Bool = false, completion: EmptyCallback? = nil)-> Bool {
        if asRoot {
            return makeAsRoot(using: to)
        }
        else {
            if let to = get(for: to) {
                if let fromNavigation = from.getNavigationViewController() {
                    fromNavigation.pushViewController(to, animated: true)
                    completion?()
                }
                else {
                    from.present(to, animated: true, completion: completion)
                }
                return true
            }
        }
        return true
    }
    
    public func requestNavigation(to: ViewControllerId, from: UIViewController?, requestData: Any?, mode: ViewControllerPresentationMode = .present)-> ViewControllerPresentRequest? {
        if let controller = self.get(for: to) {
            let request = ViewControllerPresentRequest(mode: mode, viewController: controller)
            request.presenter = from
            request.requestData = requestData
            ViewControllerPresenter.shared.presentViewController(request: request)
            return request
        }
        return nil
    }
    

    
    public func requestNavigation(to: ViewControllerId, from: UIViewController?, requestData: Any?, requestDataToo: Any?, mode: ViewControllerPresentationMode = .present)-> ViewControllerPresentRequest? {
          if let controller = self.get(for: to) {
              let request = ViewControllerPresentRequest(mode: mode, viewController: controller)
              request.presenter = from
              request.requestData = requestData
              request.requestDataToo = requestDataToo
            
              ViewControllerPresenter.shared.presentViewController(request: request)
              return request
          }
          return nil
      }
    
    public func requestNavigation(to: ViewControllerId, requestData: Any?, mode: ViewControllerPresentationMode = .present)-> ViewControllerPresentRequest? {
        return self.requestNavigation(to: to, from: nil, requestData: requestData, mode: mode)
    }
}




