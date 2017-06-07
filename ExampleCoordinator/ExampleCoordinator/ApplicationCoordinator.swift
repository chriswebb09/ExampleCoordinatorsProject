//
//  ApplicationCoordinator.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol ApplicationCoordinator {
    var appCoordinator: Coordinator! { get set }
    var window: UIWindow { get set }
    func start()
}

