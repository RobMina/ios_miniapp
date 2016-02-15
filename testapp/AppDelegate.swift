//
//  AppDelegate.swift
//  testapp
//
//  Created by Robert Mina on 2/8/16.
//  Copyright © 2016 University of Virginia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var timer = NSTimer()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        timer.invalidate()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "checkTime", userInfo: nil, repeats: true)
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func checkTime() {
        let navigationController = self.window!.rootViewController as! UINavigationController
        if let theController = navigationController.viewControllers[0] as? ToDoTableViewController {
            for item in theController.items {
                if item!.duedate.timeIntervalSinceDate(NSDate.init()) <= 0 {
                    // set alarm
                    let alertController = UIAlertController(title: item!.title, message: "Item " + item!.title + " is now due.", preferredStyle: UIAlertControllerStyle.Alert)
                    let postponeActionHandler = { (action:UIAlertAction!) -> Void in
                        let newItem = ToDoItem(title: item!.title, description: item!.description, duedate: NSDate(timeInterval: NSTimeInterval(3600.0), sinceDate: item!.duedate))
                        theController.items.append(newItem)
                        theController.sortItems()
                        theController.itemsTableView.reloadData()
                    }
                    alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil))
                    alertController.addAction(UIAlertAction(title: "postpone", style:UIAlertActionStyle.Default, handler: postponeActionHandler))
                    theController.presentViewController(alertController, animated: false, completion: nil)
                    // remove from list
                    theController.items.removeFirst()
                    theController.itemsTableView.reloadData()
                }
            }
        }
    }


}

