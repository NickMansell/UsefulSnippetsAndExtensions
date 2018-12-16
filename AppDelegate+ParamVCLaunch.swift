//
//  AppDelegate+ParamVCLaunch.swift
//  MobileiOSComponentLibrary_Example
//
//  Created by Nick Mansell on 2018-12-16.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

//MARK: Launch Parameter defintion and handling
extension AppDelegate {
    
    fileprivate enum DebugLaunchArgs: String {
        case LaunchVCID = "LaunchVCID"
        case LaunchSBName = "LaunchSBName"
    }
    
    public func launchVCFromParams() {
        
        var launchSBName: String?
        var launchVCName: String?
        _ = ProcessInfo.processInfo.arguments.map { (arg) in
            let arrKeyVal = arg.split(separator: "=")
            if arrKeyVal.count == 2 {
                if let key = DebugLaunchArgs.init(rawValue: String(arrKeyVal[0])){
                    let val = String(arrKeyVal[1])
                    switch(key) {
                    case .LaunchVCID:
                        launchVCName = val
                    case .LaunchSBName:
                        launchSBName = val
                    }
                }
            }
        }
        
        //if we have at least the storyboard to launch from, attempt to launch specified VC
        if let launchSBName = launchSBName {
            debugPrint("Launching with Storyboard: \(launchSBName).\(launchVCName ?? "INITIAL_VC")")
            window?.rootViewController(fromStoryboard: launchSBName, viewControllerID: launchVCName)
        }
    }
}

