//
//  TransitionAnimator.swift
//
//  Created by Nikita Ermolenko on 28/10/2017.
//

import UIKit

/*
 Describes object which is responsible for transitions animations
 */
protocol TransitionAnimator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
