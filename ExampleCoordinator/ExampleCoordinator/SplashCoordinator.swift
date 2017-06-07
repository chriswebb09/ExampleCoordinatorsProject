//
//  SplashCoordinator.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class SplashCoordinator: NavigationCoordinator {
    
    var type: CoordinatorType = .app
    
    weak var delegate: CoordinatorDelegate?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setup(window: UIWindow) {
         window.rootViewController = navigationController
    }
    
    func start() {
        let splashView = SplashView()
        let splashViewController = SplashViewController(splashView: splashView)
        splashViewController.delegate = self
        navigationController.viewControllers = [splashViewController]
    }
}

extension SplashCoordinator: SplashViewControllerDelegate {
    
    func splashViewFinishedAnimation(finished: Bool) {
        print("Animation is: \(finished)")
        delegate?.transitionCoordinator(type: .tabbar)
    }
}
