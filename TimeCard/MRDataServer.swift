//
//  MRDataServer.swift
//  TimeCard
//
//  Created by Martin Roeder on 6/1/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MRDataServer {
    
    static func populateSampleData() {
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        
        let timestamps = [
            (format.dateFromString("2016-05-23 9:00"), format.dateFromString("2016-05-23 17:00")),
            (format.dateFromString("2016-05-24 9:01"), format.dateFromString("2016-05-24 17:03")),
            (format.dateFromString("2016-05-25 8:38"), format.dateFromString("2016-05-25 17:10")),
            (format.dateFromString("2016-05-26 9:03"), format.dateFromString("2016-05-26 18:45")),
            (format.dateFromString("2016-05-27 8:59"), format.dateFromString("2016-05-27 16:30"))
        ]
        
        for (start, end) in timestamps {
            if let s = start {
                let startEvent = NSEntityDescription.insertNewObjectForEntityForName("ClockEvents", inManagedObjectContext: context) as NSManagedObject
                startEvent.setValue(s, forKey: "timestamp")
                startEvent.setValue("manual", forKey: "source")
                startEvent.setValue("start", forKey: "event")
                startEvent.setValue(10001, forKey: "employeeID")
            }
            
            if let e = end {
                let endEvent = NSEntityDescription.insertNewObjectForEntityForName("ClockEvents", inManagedObjectContext: context) as NSManagedObject
                endEvent.setValue(e, forKey: "timestamp")
                endEvent.setValue("manual", forKey: "source")
                endEvent.setValue("stop", forKey: "event")
                endEvent.setValue(10001, forKey: "employeeID")
            }
            
            try! context.save()
        }
        
    }
    
    static func clearData() {
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "ClockEvents")
        request.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.executeFetchRequest(request)
        
        var deletedCount = 0
        if (results.count > 0) {
            for x in results {
                if let entry = x as? NSManagedObject {
                    context.deleteObject(entry)
                    deletedCount += 1
                }
            }
        }
        else {
            print("No results found")
        }
        if deletedCount > 0 {
            print("\(deletedCount) items deleted")
        }
    }
    
    static func getTimeCard(containingDate:NSDate) -> MRTimeCard {
        let timeCard = MRTimeCard()
        
        var startOfWeek:NSDate?
        let calendar = NSCalendar.currentCalendar()
        calendar.rangeOfUnit(.WeekOfYear, startDate: &startOfWeek, interval: nil, forDate: containingDate)
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "ClockEvents")
        request.returnsObjectsAsFaults = false
        if let s = startOfWeek {
            let e = s.dateByAddingTimeInterval(NSTimeInterval(7*24*60*60))
            let sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: true)]
            request.sortDescriptors = sortDescriptors
            request.predicate = NSPredicate(format: "timestamp >= %@ && timestamp < %@", s, e)
        }
        
        let results:NSArray = try! context.executeFetchRequest(request)
        
        if (results.count > 0) {
            for x in results {
                if let entry = x as? NSManagedObject,
                    let timestamp = entry.valueForKey("timestamp") as? NSDate,
                    let eventType = entry.valueForKey("event") as? String {
                    timeCard.appendEvent(timestamp, type: eventType)
                }
            }
        }
        return timeCard
    }
    
    static func createClockEvent(timestamp:NSDate, type:String, source:String) {
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        
        let event = NSEntityDescription.insertNewObjectForEntityForName("ClockEvents", inManagedObjectContext: context) as NSManagedObject
        event.setValue(timestamp, forKey: "timestamp")
        event.setValue(source, forKey: "source")
        event.setValue(type, forKey: "event")
        event.setValue(10001, forKey: "employeeID")
        
        try! context.save()
    }
}