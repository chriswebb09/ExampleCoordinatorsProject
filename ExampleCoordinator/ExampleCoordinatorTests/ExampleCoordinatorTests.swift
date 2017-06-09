//
//  ExampleCoordinatorTests.swift
//  ExampleCoordinatorTests
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import XCTest
@testable import ExampleCoordinator

class ExampleCoordinatorTests: XCTestCase {
    
    var mainCoordinator: MainCoordinator!
    
    override func setUp() {
        super.setUp()
        mainCoordinator = MainCoordinator(window: UIWindow(frame: UIScreen.main.bounds))
    }
    
    override func tearDown() {
        super.tearDown()
        mainCoordinator = nil
    }
    
    func testMainCoordinatorStart() {
        let splashViewController = SplashViewController(splashView: SplashView())
        let navigationContoller = UINavigationController(rootViewController: splashViewController)
        let startCoordinator = SplashCoordinator(navigationController: navigationContoller)
        mainCoordinator.setup(coordinator: startCoordinator)
    }
}
