//
//  AppDelegate.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(window: window)
        let splashView = SplashView()
        let splashViewController = SplashViewController(splashView: splashView)
        let navController = UINavigationController(rootViewController: splashViewController)
        let splashCoordinator = SplashCoordinator(navigationController: navController)
        splashCoordinator.setup(window: coordinator.window)
        coordinator.setup(coordinator: splashCoordinator)
        coordinator.start()
        return true
    }
}

