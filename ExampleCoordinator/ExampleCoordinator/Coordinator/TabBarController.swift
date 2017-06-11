//
//  TabBarController.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupTabBar(tabBar: tabBar, view: view)
    }
    
    // General dimensions and look of tabbar
    
    private func setupTabBar(tabBar: UITabBar, view: UIView) {
        tabBar.isTranslucent = true
        tabBar.tintColor = UIColor(red:0.92, green:0.32, blue:0.33, alpha:1.0)
    }
    
    func setup(with controllerOne: UIViewController, and controllerTwo: UIViewController) {
        let tabOne = setupTab(viewController: controllerOne)
        let tabTwo = setupTab(viewController: controllerTwo)
        setTabTitles(controllers: [tabOne, tabTwo])
    }
    
    func setup(with controllers: [UINavigationController]) {
        setTabTitles(controllers: controllers)
    }
    
    func setTabTitles(controllers: [UINavigationController]) {
        viewControllers = controllers
        tabBar.items?[0].title = "ViewOne"
        tabBar.items?[1].title = "ViewTwo"
        selectedIndex = 0
    }
    
    private func setupTab(viewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: viewController)
    }
}
