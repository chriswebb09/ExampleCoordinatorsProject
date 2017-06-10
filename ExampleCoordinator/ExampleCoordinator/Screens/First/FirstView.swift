//
//  FirstView.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/9/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class FirstView: UIView {
    func configure() {
         CALayer.createGradientLayer(layer: layer,
                                     bounds: bounds,
                                     colors: [UIColor(red:0.56, green:0.58, blue:0.59, alpha:1.0).cgColor, UIColor(red:0.27, green:0.29, blue:0.29, alpha:1.0).cgColor])
    }
}

