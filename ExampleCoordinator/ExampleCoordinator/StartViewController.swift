//
//  StartViewController.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/9/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

final class StartViewController: UIViewController {
    
    var loadingPop = LoadingPopover()
    var startView: StartView = StartView()
    weak var delegate: StartViewControllerDelegate?
    
    init(startView: StartView = StartView()) {
        self.startView = startView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        startView.tag = 0
        view.addView(view: startView, type: .full)
        startView.delegate = self
    }
    
    func showLoadingView(loadingPop: LoadingPopover) {
        loadingPop.setupPop(popView: loadingPop.popView)
        loadingPop.showPopView(viewController: self)
        loadingPop.popView.isHidden = false
    }
    
    func hideLoadingView() {
        loadingPop.popView.removeFromSuperview()
        loadingPop.removeFromSuperview()
        loadingPop.hidePopView(viewController: self)
        view.sendSubview(toBack: loadingPop)
    }
}

// MARK: - StartViewDelegate

extension StartViewController: StartViewDelegate {
    
    func continueAsGuestTapped() {
        showLoadingView(loadingPop: loadingPop)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.delegate?.continueAsGuestSelected()
        }
    }
    
    func createAccountTapped() {
        delegate?.createAccountSelected()
    }
    
    func loginTapped() {
        delegate?.loginSelected()
    }
}

enum ViewType {
    case full, element
}

extension UIView {
    
    func addView(view: UIView, type: ViewType) {
        switch type {
        case .full:
            view.frame = UIScreen.main.bounds
            addSubview(view)
            view.layoutSubviews()
        case .element:
            addSubview(view)
            view.layoutSubviews()
        }
    }
}
