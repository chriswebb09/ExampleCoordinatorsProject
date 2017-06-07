//
//  SplashView.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol SplashViewDelegate: class {
    func animationIsComplete()
}

typealias completion = () -> Void

final class SplashView: UIView {
    
    weak var delegate: SplashViewDelegate?
    
    var animationDuration: Double = 0.5
    
    // MARK: - Configure
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame = UIScreen.main.bounds
        backgroundColor = .white
    }
    
    func setupImageView(logoImageView: UIImageView) {
        
    }

    // MARK: - Animation
    
    func zoomAnimation(_ handler: completion? = nil) {
        let duration: TimeInterval = animationDuration
       // alpha = LogoConstants.startAlpha
        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard let strongSelf = self else { return }
           // strongSelf.speakerZero.transform = LogoConstants.zoomOutTranform
            strongSelf.alpha = 0
            }, completion: { finished in
                DispatchQueue.main.async {
                    self.delegate?.animationIsComplete()
                }
                handler?()
        })
    }
}
