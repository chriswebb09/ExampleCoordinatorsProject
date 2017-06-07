//
//  CoordinatorDelegate.swift
//  ExampleCoordinator
//
//  Created by Christopher Webb-Orenstein on 6/7/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

protocol CoordinatorDelegate: class {
    func transitionCoordinator(type: CoordinatorType)
}

