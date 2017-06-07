//
//  SplashViewController.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {
    
    weak var delegate: SplashViewControllerDelegate?
    
    private let splashView: SplashView!
    
    init(splashView: SplashView = SplashView()) {
        self.splashView = splashView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        splashView.zoomAnimation {
            print("animation")
        }
    }
}

extension SplashViewController: SplashViewDelegate {
    
    func animationIsComplete() {
        animate()
    }
    
    func animate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.delegate?.splashViewFinishedAnimation(finished: true)
        }
    }
}
