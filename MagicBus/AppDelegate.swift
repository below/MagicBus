//
//  AppDelegate.swift
//  MagicBus
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        if userActivity.activityType == "com.vonbelow.magicbus.history" || userActivity.activityType == "BuyTicketIntent" {
            guard let window = window,
                let rootViewController = window.rootViewController as? UINavigationController else {
                    return false
            }
            
            restorationHandler(rootViewController.viewControllers)
            
            return true
        } else {
            return false
        }
    }

}

