//
//  AppDelegate.swift
//  MVVMTableView
//
//  Created by Rajeshkumar maddi on 22/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let mobiles: [ViewModel] = {
    let iphonex = MobileModel(name: "iPhone", model: "X", company: "Apple", Year: "2018",image: "iphoneX")
    let iphone8 = MobileModel(name: "iPhone", model: "8", company: "Apple", Year: "2017", image: "iphone8")
    let samsung = MobileModel(name: "Samsung", model: "S8", company: "Samsung", Year: "2011",image: "samsungS8")
    let lenovo = MobileModel(name: "Lenovo", model: "S60", company: "Lenovo", Year: "2016",image: "lenovo-s60")
    let xiomi = MobileModel(name: "Xiaomi", model: "5A", company: "Xiaomi", Year: "2015",image: "xiaomi5A")
       
        return [ViewModel(mobile:iphonex),ViewModel(mobile:iphone8),ViewModel(mobile:samsung),ViewModel(mobile:lenovo),ViewModel(mobile:xiomi)]
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

