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
    
    func start() {
        tabBarController.setTabTitles(controllers: [childCoordinators[0].navigationController, childCoordinators[1].navigationController])
        window.rootViewController = tabBarController
    }
}

class TabCoordinator: NavigationCoordinator {
   
    var type: CoordinatorType = .tabbar
    
    weak var delegate: CoordinatorDelegate?
    
    var navigationController: UINavigationController
    
    var childControllers: [UIViewController]
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childControllers = []
    }
    
    convenience init(navigationController: UINavigationController, controller: UIViewController) {
        self.init(navigationController: navigationController)
        navigationController.viewControllers = [controller]
    }
    
    func start() {
        navigationController.viewControllers = childControllers
    }

    
    func addChild(viewController: UIViewController) {
        childControllers.append(viewController)
    }
}
