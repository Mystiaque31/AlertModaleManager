//
//  UIAlertBaseVC.swift
//  AlertModaleManager
//
//  Created by Thibault on 06/08/2020.
//  Copyright © 2020 Thibault. All rights reserved.
//

import UIKit

open class UIAlertBaseVC: UIViewController {
    
    public var userInfo : [AnyHashable : Any]?

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        AlertModaleManager.instance.didStopPresentingOneAlert()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
