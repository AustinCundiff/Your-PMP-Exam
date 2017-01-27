//
//  ViewController.swift
//  Your PMP Exam
//
//  Created by Austin Cundiff on 1/18/17.
//  Copyright © 2017 Austin Cundiff. All rights reserved.
//

import UIKit
import Foundation
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var fg: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func quit(_ sender: UIButton) {
        
        exit(0)
    }
    @IBAction func linkClicked(_ sender: UIButton)
    {
        self.openUrl(url: "htttp://YourProjectManagementInstructor.com");
    }
    func openUrl(url:String!) {
        
        let targetURL=NSURL(string: url)
        let application=UIApplication.shared
        
        application.openURL(targetURL as! URL);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

