//
//  MRTimeCard.swift
//  TimeCard
//
//  Created by Martin Roeder on 6/1/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

import Foundation

class MRTimeCard {
    
    var hours:[MRHours] = [MRHours]()
    var next:MRHours?
    
    func appendEvent(time:NSDate, type:String) {
        
        if type == "start" {
            hours.append(MRHours())
            if let x = hours.last {
                x.startClock(time)
            }
        }
        else {
            
            if let x = hours.last {
                x.stopClock(time)
            }
        }
    }
    
    func clear() {
        hours.removeAll()
    }
    
    func getString() -> String {
        var total = 0.0
        var str = "Date\t\t\t\tStart\t\tEnd\t\tHours\n"
        for x in hours {
            str += x.getString()
            str += "\n"
            total += x.getHours()
        }
        str += String(format: "Total Hours: %.2f", total)
        return str
    }
    
}