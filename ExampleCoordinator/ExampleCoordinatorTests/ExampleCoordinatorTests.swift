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
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
        mainCoordinator = MainCoordinator(window: window)
    }
    
    override func tearDown() {
        super.tearDown()
        window = nil
        mainCoordinator = nil
    }
    
    func testMainCoordinatorStart() {
        let splashViewController = SplashViewController(splashView: SplashView())
        let navigationContoller = UINavigationController(rootViewController: splashViewController)
        let startCoordinator = SplashCoordinator(navigationController: navigationContoller)
        mainCoordinator.setup(coordinator: startCoordinator)
        mainCoordinator.start()
        XCTAssertTrue(mainCoordinator.appCoordinator.type == CoordinatorType.app)
    }
    
    func testMainCoordinatorTabBar() {
        let splashViewController = SplashViewController(splashView: SplashView())
        let navigationContoller = UINavigationController(rootViewController: splashViewController)
        let startCoordinator = SplashCoordinator(navigationController: navigationContoller)
        mainCoordinator.setup(coordinator: startCoordinator)
        mainCoordinator.start()
        XCTAssertTrue(mainCoordinator.appCoordinator.type == CoordinatorType.app)
        startCoordinator.splashViewFinishedAnimation(finished: true)
        startCoordinator.continueAsGuestSelected()
        XCTAssertTrue(mainCoordinator.appCoordinator.type == CoordinatorType.tabbar)
    }
}
