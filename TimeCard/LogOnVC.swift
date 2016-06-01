//
//  LogOnVC.swift
//  TimeCard
//
//  Created by Martin Roeder on 5/30/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

import UIKit
import CoreData

class LogOnVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clearData(sender: AnyObject) {
        MRDataServer.clearData()
        MRDataServer.populateSampleData()
    }
    
    

}
