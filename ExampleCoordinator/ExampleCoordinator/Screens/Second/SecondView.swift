//
//  SecondView.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class SecondView: UIView {
    func configure() {
        CALayer.createGradientLayer(layer: layer, bounds: bounds, colors: [UIColor(red:0.05, green:0.75, blue:0.99, alpha:1.0).cgColor, UIColor(red:0.90, green:0.98, blue:1.00, alpha:1.0).cgColor])
    }
}

