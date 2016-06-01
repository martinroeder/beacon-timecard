//
//  MRHours.swift
//  TimeCard
//
//  Created by Martin Roeder on 6/1/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

import Foundation


class MRHours {
    
    var start:NSDate?
    var end:NSDate?
    
    func getHours() -> Double {
        if let s = start, e = end {
            return e.timeIntervalSinceDate(s) / 3600
        }
        else {
            return 0
        }
    }
        
    func formatHours() -> String {
        let hours = getHours()
        return hours > 0 ? String(format:"%.2f", hours) : "--"
    }
    
    func formatDate() -> String {
        let dayFormat = NSDateFormatter()
        dayFormat.dateStyle = NSDateFormatterStyle.MediumStyle
        if let s = start {
            return dayFormat.stringFromDate(s)
        }
        else {
            return "--"
        }
    }
    
    func formatTime(time:NSDate?) -> String {
        let timeFormat = NSDateFormatter()
        timeFormat.dateFormat = "HH:mm"
        if let t = time {
            return timeFormat.stringFromDate(t)
        }
        else {
            return "--\t"
        }
    }
    
    func startClock(time:NSDate) -> Bool {
        start = time
        return true
    }
    
    func stopClock(time:NSDate) -> Bool {
        end = time
        return true        
    }
    
    func getString() -> String {
        
        return "\(formatDate())\t\t\(formatTime(start))\t\(formatTime(end))\t\(formatHours())"
        
    }
}