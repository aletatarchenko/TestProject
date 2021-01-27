//
//  PushTransition.swift
//
//  Created by Nikita Ermolenko on 28/10/2017.
//

import UIKit

/*
 Default class for push transition
 Can implement custom transition animation via @param animator
 */
class PushTransition: NSObject, Transition {
  var animator: TransitionAnimator?
  var isAnimated: Bool = true
  private var dismissCompletion: VoidCallback?
  
  weak var viewController: UIViewController?
  
  init(animator: TransitionAnimator? = nil, isAnimated: Bool = true) {
    self.animator = animator
    self.isAnimated = isAnimated
  }
  
  // MARK: - Transition
  
  func open(_ viewController: UIViewController) {
    self.viewController?.navigationController?.delegate = self
    self.viewController?.navigationController?.pushViewController(viewController, animated: isAnimated)
  }
  
  func close(_: UIViewController, completion: VoidCallback? = nil) {
    dismissCompletion = completion
    viewController?.navigationController?.delegate = self
    viewController?.navigationController?.popViewController(animated: isAnimated, completion: completion)
  }
}

// MARK: - UINavigationControllerDelegate

extension PushTransition: UINavigationControllerDelegate {
  func navigationController(_: UINavigationController, didShow _: UIViewController, animated _: Bool) {
    // add presentCompletion and call it here if needed
  }
  
  func navigationController(_: UINavigationController,
                            animationControllerFor operation: UINavigationController.Operation,
                            from _: UIViewController,
                            to _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    guard let animator = animator else {
      return nil
    }
    if operation == .push {
      animator.isPresenting = true
      return animator
    } else {
      animator.isPresenting = false
      return animator
    }
  }
}

extension UINavigationController {
  func popViewController(animated: Bool, completion: VoidCallback?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.popViewController(animated: animated)
    CATransaction.commit()
  }
  func pushViewController(viewController: UIViewController, animated: Bool, completion: VoidCallback?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }
}
