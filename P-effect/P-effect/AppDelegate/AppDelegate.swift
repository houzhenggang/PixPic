//
//  AppDelegate.swift
//  P-effect
//
//  Created by Jack Lapin on 14.01.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        User.registerSubclass()
        Parse.enableLocalDatastore()
        Parse.setApplicationId(Constants.ParseApplicationId.AppID, clientKey: Constants.ParseApplicationId.ClientKey)
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(Constants.BackButtonTitle.PositionAdjustment, forBarMetrics: .Default)

        Router.sharedRouter().onStart(true)
        
        Fabric.with([Crashlytics.self])
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
}