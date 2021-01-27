//
//  RootTransitionAnimator.swift
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

extension TimeInterval {
  static let shortAnimation: TimeInterval = 0.25
  static let defaultAnimation: TimeInterval = 0.4
}

final class RootTransitionAnimator: NSObject, TransitionAnimator {
  var isPresenting: Bool = false
  private let animated: Bool
  
  init(animated: Bool = true) {
    self.animated = animated
    super.init()
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    animated ? TimeInterval.defaultAnimation : .zero
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: .from),
      let toVC = transitionContext.viewController(forKey: .to) else {
      return
    }
    
    let container = transitionContext.containerView
    let duration = transitionDuration(using: transitionContext)
    
    toVC.view.frame = container.bounds
    container.addSubview(toVC.view)
    container.addSubview(fromVC.view)
    
    UIView.animate(withDuration: duration, animations: {
      fromVC.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
      fromVC.view.alpha = 0
    }) { _ in
      fromVC.view.removeFromSuperview()
      transitionContext.completeTransition(true)
    }
  }
}
