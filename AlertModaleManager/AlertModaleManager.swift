//
//  AlertModaleManager.swift
//  AlertModaleManager
//
//  Created by Thibault on 06/08/2020.
//  Copyright © 2020 Thibault. All rights reserved.
//

import Foundation
import UIKit

public class AlertModaleManager : NSObject {
    static public let instance = AlertModaleManager()
    
    private var isDisplaying = false
    //First view => view to present / Second view => view presenting
    private var viewToPresent = [UIAlertModaleStruct]()
    
    private override init() {
        super.init()
    }
    
    private func run() {
        if !isDisplaying && viewToPresent.count > 0 {
            let item = self.viewToPresent.removeFirst()
            let viewToPresent = item.viewToPresent
            let viewPresenting = item.viewPresenting
            print(viewPresenting.isModalInPresentation)
            viewPresenting.present(viewToPresent, animated: true, completion: {
                self.isDisplaying = true
            })
        }
    }
    
    open func presentView(_ viewToPresent :  UIViewController, _ viewPresenting : UIViewController) {
        if viewToPresent is UIAlertBaseVC {
            self.viewToPresent.append(UIAlertModaleStruct(viewToPresent : viewToPresent, viewPresenting: viewPresenting))
            run()
        } else {
            let thisType = type(of: viewToPresent)
            let typeName = String(describing: thisType)
            print("The class \(typeName) doesn't inherit from UIAlertBaseVC and will not be handle by the pod AlertModaleManager.")
        }
    }
    
    open func presentView(_ viewToPresent : UIAlertBaseProtocol.Type, _ viewPresenting : UIViewController, _ userInfo : [AnyHashable : Any]? = nil, _ transitionStyle : UIModalTransitionStyle = .crossDissolve, _ presentationStyle : UIModalPresentationStyle = .overFullScreen) {
        let storyboard = UIStoryboard(name: viewToPresent.storyboardName, bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: viewToPresent.storyboardIdentifier) as? UIAlertBaseVC {
            controller.userInfo = userInfo
            controller.modalPresentationStyle = presentationStyle
            controller.modalTransitionStyle = transitionStyle
            self.viewToPresent.append(UIAlertModaleStruct(viewToPresent : controller, viewPresenting: viewPresenting))
            run()
        } else {
            let thisType = type(of: viewToPresent)
            let typeName = String(describing: thisType)
            print("The class \(typeName) doesn't inherit from UIAlertBaseVC and will not be handle by the pod AlertModaleManager.")
        }
    }
    
    open func didStopPresentingOneAlert() {
        isDisplaying = false
        run()
    }
}

struct UIAlertModaleStruct {
    var viewToPresent : UIViewController
    var viewPresenting : UIViewController
}
