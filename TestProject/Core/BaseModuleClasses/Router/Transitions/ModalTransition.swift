//
//  ModalTransition.swift
//
//  Created by Nikita Ermolenko on 28/10/2017.
//

import UIKit

/*
 Default class for modal presentation
 Can implement custom transition animation via @param animator
 */
class ModalTransition: NSObject {
  var animator: TransitionAnimator?
  var isAnimated: Bool = true
  
  var modalTransitionStyle: UIModalTransitionStyle
  var modalPresentationStyle: UIModalPresentationStyle
    
  weak var viewController: UIViewController?
  
  init(animator: TransitionAnimator? = nil,
       isAnimated: Bool = true,
       modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
       modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
    self.animator = animator
    self.isAnimated = isAnimated
    self.modalTransitionStyle = modalTransitionStyle
    self.modalPresentationStyle = modalPresentationStyle
  }
}

// MARK: - Transition

extension ModalTransition: Transition {
  func open(_ viewController: UIViewController) {
    viewController.transitioningDelegate = self
    viewController.modalTransitionStyle = modalTransitionStyle
    viewController.modalPresentationStyle = modalPresentationStyle
    
    self.viewController?.present(viewController, animated: isAnimated)
  }
  
  func close(_ viewController: UIViewController, completion: VoidCallback? = nil) {
    viewController.dismiss(animated: isAnimated, completion: completion)
  }
}

// MARK: - UIViewControllerTransitioningDelegate

extension ModalTransition: UIViewControllerTransitioningDelegate {
  func animationController(forPresented _: UIViewController,
                           presenting _: UIViewController,
                           source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    guard let animator = animator else {
      return nil
    }
    animator.isPresenting = true
    return animator
  }
  
  func animationController(forDismissed _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    guard let animator = animator else {
      return nil
    }
    animator.isPresenting = false
    return animator
  }
}
