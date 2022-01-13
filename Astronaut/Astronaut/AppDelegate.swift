//
//  AppDelegate.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordiantor: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordiantor = AppCoordinator(window: window!)
        appCoordiantor.start()
        
        return true
    }

}

