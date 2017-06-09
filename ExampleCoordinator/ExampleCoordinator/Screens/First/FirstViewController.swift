//
//  FirstViewController.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: class {
    func logoutButtonTapped()
}

class FirstViewController: UIViewController {
    
    weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstViewController"
        view.backgroundColor = .green
        var logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItems = [logoutButton]
    }
    
    func logout() {
        print("log out")
        delegate?.logoutButtonTapped()
    }
}
