//
//  AlertExampleVC.swift
//  AlertModaleManagerExamples
//
//  Created by Thibault on 06/08/2020.
//  Copyright © 2020 Thibault. All rights reserved.
//

import UIKit
import AlertModaleManager

class AlertExampleVC: UIAlertBaseVC, UIAlertBaseProtocol {
    static var storyboardIdentifier: String = "alertExample"
    static var storyboardName : String = "Alert"
    
    var variableToSet : Date!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
