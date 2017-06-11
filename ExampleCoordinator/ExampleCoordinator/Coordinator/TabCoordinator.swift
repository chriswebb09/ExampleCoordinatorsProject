//
//  TabCoordinator.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/10/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit 

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

extension TabBarCoordinator: FirstViewControllerDelegate {
    
    func logoutButtonTapped() {
        print("tab logoout")
        delegate?.transitionCoordinator(type: .app)
    }
}
