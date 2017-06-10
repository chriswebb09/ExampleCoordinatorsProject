//
//  TabCoordinator.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class TabBarCoordinator: TabControllerCoordinator {
    
    var window: UIWindow!
    var childCoordinators: [NavigationCoordinator]
    var tabBarController: TabBarController
    var type: CoordinatorType = .tabbar
    weak var delegate: CoordinatorDelegate?

    init(tabBarController: TabBarController) {
        self.tabBarController = tabBarController
        self.childCoordinators = []
    }

    func setup(navigationController: UINavigationController) {
        let tabCoordinator = TabCoordinator(navigationController: navigationController)
        childCoordinators.append(tabCoordinator)
    }
    
    func setup(coordinator: TabCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    func start() {
        tabBarController.setTabTitles(controllers: [childCoordinators[0].navigationController, childCoordinators[1].navigationController])
        window.rootViewController = tabBarController
    }
}

extension TabBarCoordinator: CoordinatorDelegate {
    func transitionCoordinator(type: CoordinatorType) {
        delegate?.transitionCoordinator(type: type)
    }
}
