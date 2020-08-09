//
//  ViewController.swift
//  AlertModaleManagerExamples
//
//  Created by Thibault on 06/08/2020.
//  Copyright © 2020 Thibault. All rights reserved.
//

import UIKit
import AlertModaleManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Doesn't work because the view isn't presenting
        AlertModaleManager.instance.presentView(AlertExampleVC.self, self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //To create a view who has special need as a variable which has to be set etc
        
//        let storyboard = UIStoryboard(name: "Alert", bundle: Bundle.main)
//        let controller = storyboard.instantiateViewController(withIdentifier: "alertExample") as! AlertExampleVC
//        controller.variableToSet = Date()
//        controller.modalPresentationStyle = .overFullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        AlertModaleManager.instance.presentView(controller, self)
        
        //Easiest way to present a view by default
        AlertModaleManager.instance.presentView(AlertExampleVC.self, self)
    }
}

