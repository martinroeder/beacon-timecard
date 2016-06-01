//
//  TimeCardVC.swift
//  TimeCard
//
//  Created by Martin Roeder on 5/30/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

import UIKit
import CoreData

class TimeCardVC: UIViewController {
    
    var displayedWeek = NSDate()
    
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var timeCardText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        updateDisplayedWeek()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func logoutPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func decrementWeek(sender: AnyObject) {
        displayedWeek = displayedWeek.dateByAddingTimeInterval(-NSTimeInterval(7*24*60*60))
        updateDisplayedWeek()
    }
    
    @IBAction func incrementWeek(sender: AnyObject) {
        displayedWeek = displayedWeek.dateByAddingTimeInterval(+NSTimeInterval(7*24*60*60))
        updateDisplayedWeek()
    }
    
    func updateDisplayedWeek() {
        let timeCard = MRDataServer.getTimeCard(displayedWeek)
        timeCardText.text = timeCard.getString()
        
        let calendar = NSCalendar.currentCalendar()
        let week = calendar.component(.WeekOfYear, fromDate: displayedWeek)
        
        weekLabel.text = "Week \(week)"
    }

}
