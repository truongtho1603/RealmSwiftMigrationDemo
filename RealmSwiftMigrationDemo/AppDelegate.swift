//
//  AppDelegate.swift
//  RealmSwiftMigrationDemo
//
//  Created by Thomas Do on 03/09/2018.
//  Copyright © 2018 Tho Do. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        persist()

        fetch()
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

// MARK: - Realm Stuff
extension AppDelegate {
    func initRealm() -> Realm {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("v1.realm")
        let config = Realm.Configuration(fileURL: documentURL,
                                         schemaVersion: 2,
                                         migrationBlock: { (migration, version) in
                                            migration.enumerateObjects(ofType: "Dog", { (old, new) in
                                            })
                                        },
                                         deleteRealmIfMigrationNeeded: false)

        return try! Realm(configuration: config)
    }

    func persist() {
        let myDog = Dog()
        myDog.name = "lulu"

        let realm = initRealm()

        try! realm.write {
            realm.add(myDog)
        }
    }

    func fetch() {
        let realm = initRealm()
        let objs = realm.objects(Dog.self)
        print(objs)
    }
}
