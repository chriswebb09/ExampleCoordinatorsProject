//
//  SecondViewController.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var secondView = SecondView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondViewController"
        secondView.frame = UIScreen.main.bounds
        secondView.configure()
        view.addSubview(secondView)
    }
}
