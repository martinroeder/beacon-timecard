//
//  MRBeacon.swift
//  TimeCard
//
//  Created by Martin Roeder on 6/1/16.
//  Copyright © 2016 Martin Roeder. All rights reserved.
//

//  NOTE: The gimbal framework needs to be integrated before this code will compile
// 
//import Foundation
//
//class MRBeacon: NSObject, GMBLPlaceManagerDelegate {
//    
//    var placeManager:GMBLPlaceManager?
// 
//    override init() {
//        
//        super.init()
//        
//        Gimbal.setAPIKey("API_KEY", options: nil)
//        self.placeManager = GMBLPlaceManager()
//        if let pm = placeManager {
//            pm.delegate = self
//        }
//    }
//    
//    func start() {
//        GMBLPlaceManager.startMonitoring()
//    }
//    
//    func stop() {
//        GMBLPlaceManager.stopMonitoring()
//    }
//    
//    func placeManager(manager: GMBLPlaceManager!, didBeginVisit visit: GMBLVisit!) {
//        MRDataServer.createClockEvent(NSDate(), type: "start", source: "beacon")
//    }
//    
//    func placeManager(manager: GMBLPlaceManager!, didEndVisit visit: GMBLVisit!) {
//        MRDataServer.createClockEvent(NSDate(), type: "stop", source: "beacon")
//    }
//    
//}

