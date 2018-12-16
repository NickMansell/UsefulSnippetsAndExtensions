//
//  UIWindow+RootViewControllerFromSBAndVCID.swift
//  MobileiOSComponentLibrary_Example
//
//  Created by Nick Mansell on 2018-12-16.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    public func rootViewController(fromStoryboard: String, viewControllerID: String?){
        do {
            #warning("TODO: Nick - These methods throw NSException instead of SwiftError object.  Need to define method of catching these in ObjC-Swift header")
            let sb = try UIStoryboard.init(name: fromStoryboard, bundle: nil)
            //NOTE: because instantiateViewController and instantiateInitialViewController both are guaranteed to either return a strong reference to loaded ViewController or throw error, there's no need for interstitial optional var between loadingVC and setting window root
            if let vcID = viewControllerID {
                self.rootViewController = try sb.instantiateViewController(withIdentifier: vcID)
            }else {
                self.rootViewController = try sb.instantiateInitialViewController()
            }
        } catch {
            debugPrint("Could not load \(fromStoryboard).\(viewControllerID)")
        }
    }
}
