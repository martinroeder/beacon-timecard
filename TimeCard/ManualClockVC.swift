//
//  ManualClockVC.swift
//  TimeCard
//
//  Created by Martin Roeder on 6/1/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

import UIKit
import CoreData

class ManualClockVC: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let format = NSDateFormatter()
        format.timeStyle = .MediumStyle
        timeLabel.text = format.stringFromDate(NSDate())
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

    @IBAction func clockInPressed(sender: AnyObject) {
        MRDataServer.createClockEvent(NSDate(), type: "start", source: "manual")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func clockOutPressed(sender: AnyObject) {
        MRDataServer.createClockEvent(NSDate(), type: "stop", source: "manual")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    
}
