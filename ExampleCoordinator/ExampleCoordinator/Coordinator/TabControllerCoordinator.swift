//
//  TabControllerCoordinator.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

protocol TabControllerCoordinator: Coordinator {
    var tabBarController: TabBarController { get set }
    var childCoordinators: [NavigationCoordinator] { get set }
}
