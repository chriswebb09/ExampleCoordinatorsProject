//
//  MainCoordinator.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class MainCoordinator: ApplicationCoordinator {
    
    var window: UIWindow
    var appCoordinator: Coordinator!
    
    init(window: UIWindow?) {
        guard let window = window else { fatalError("Invalid, no window") }
        self.window = window
    }
    
    func setup(coordinator: Coordinator) {
        appCoordinator = coordinator
        appCoordinator.delegate = self
    }
    
    func start() {
        guard let coordinator = appCoordinator else { return }
        coordinator.start()
        window.makeKeyAndVisible()
    }
}

extension MainCoordinator: CoordinatorDelegate {
    
    func transitionCoordinator(type: CoordinatorType) {
        switch type {
        case .app:
            let startView = StartView()
            let startController = StartViewController(startView: startView)
            let navController = UINavigationController(rootViewController: startController)
            let startCoordinator = SplashCoordinator(navigationController: navController)
            startCoordinator.setup(window: window)
            startCoordinator.delegate = self
            appCoordinator = startCoordinator
            start()
            
        case .tabbar:
            let tabbarController = TabBarController()
            let tabbBarCoordinator = TabBarCoordinator(tabBarController: tabbarController)
            tabbBarCoordinator.window = window
            tabbBarCoordinator.delegate = self 
            let firstViewController = FirstViewController()
            firstViewController.delegate = tabbBarCoordinator
            let mediaTab = UINavigationController(rootViewController: firstViewController)
            tabbBarCoordinator.setup(navigationController: mediaTab)
            let secondViewController = SecondViewController()
            let settingsTab = UINavigationController(rootViewController: secondViewController)
            tabbBarCoordinator.setup(navigationController: settingsTab)
            appCoordinator = tabbBarCoordinator
            start()
        }
    }
}
