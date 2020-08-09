//
//  AlertModaleManager.swift
//  AlertModaleManager
//
//  Created by Thibault on 06/08/2020.
//  Copyright © 2020 Thibault. All rights reserved.
//

import Foundation
import UIKit

open class AlertModaleManager : NSObject {
    static public let instance = AlertModaleManager()
    
    private var isDisplaying = false
    //First view => view to present / Second view => view presenting
    private var viewToPresent = [(UIViewController, UIViewController)]()
    
    private override init() {
        super.init()
    }
    
    private func run() {
        if !isDisplaying && viewToPresent.count > 0 {
            let pair = self.viewToPresent.removeFirst()
            let viewToPresent = pair.0
            let viewPresenting = pair.1
            viewPresenting.present(viewToPresent, animated: true, completion: {
                self.isDisplaying = true
            })
        }
    }
    
    open func presentView(_ viewToPresent :  UIViewController, _ viewPresenting : UIViewController) {
        self.viewToPresent.append((viewToPresent, viewPresenting))
        run()
    }
    
    open func presentView(_ viewToPresent : UIAlertBaseProtocol.Type, _ viewPresenting : UIViewController, _ transitionStyle : UIModalTransitionStyle = .crossDissolve, _ presentationStyle : UIModalPresentationStyle = .overFullScreen) {
        let storyboard = UIStoryboard(name: viewToPresent.storyboardName, bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: viewToPresent.storyboardIdentifier)
        controller.modalPresentationStyle = presentationStyle
        controller.modalTransitionStyle = transitionStyle
        self.viewToPresent.append((controller, viewPresenting))
        run()
    }
    
    open func didStopPresentingOneAlert() {
        isDisplaying = false
        run()
    }
}
