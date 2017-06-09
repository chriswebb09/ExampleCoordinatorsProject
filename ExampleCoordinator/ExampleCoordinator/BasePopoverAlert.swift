//
//  BasePopoverAlert.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/9/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

struct BasePopoverAlertConstants {
    static let popViewX = UIScreen.main.bounds.width / 2
    static let popViewY = UIScreen.main.bounds.height / 2
    static let containerOpacity: Float = 0.4
}

struct BasePopConstants {
    static let heightMultiplier: CGFloat = 0.25
}


class BasePopoverAlert: UIView {
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.black
        containerView.layer.opacity = BasePopoverAlertConstants.containerOpacity
        return containerView
    }()
    
    func showPopView(viewController: UIViewController) {
        containerView.isHidden = false
        containerView.frame = UIScreen.main.bounds
        containerView.center = CGPoint(x: BasePopoverAlertConstants.popViewX, y: BasePopoverAlertConstants.popViewY)
        viewController.view.addSubview(containerView)
    }
    
    func hidePopView(viewController: UIViewController){
        viewController.view.sendSubview(toBack: containerView)
        containerView.isHidden = true
    }
}
