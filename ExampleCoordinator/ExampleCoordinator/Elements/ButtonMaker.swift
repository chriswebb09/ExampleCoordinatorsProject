//
//  ButtonMaker.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/9/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol ButtonMaker {
    var text: String { get set }
    var textColor: UIColor { get set }
    var buttonBorderWidth: CGFloat { get set }
    var buttonBorderColor: CGColor { get set }
    var buttonBackgroundColor: UIColor { get set }
    
    func createButton() -> UIButton
}
