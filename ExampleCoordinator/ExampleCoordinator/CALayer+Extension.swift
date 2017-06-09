//
//  CALayer+Extension.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/8/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

extension CALayer {
    static func createGradientLayer(layer: CALayer, bounds: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(red:0.31, green:0.49, blue:0.63, alpha:1.0).cgColor, UIColor(red:0.18, green:0.27, blue:0.33, alpha:1.0).cgColor]
        layer.addSublayer(gradientLayer)
    }
    
}
