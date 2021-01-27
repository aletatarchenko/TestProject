//
//  UIViewController+Extensions.swift
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

extension UIViewController {
  @discardableResult
  func addEndEditingGesture() -> UITapGestureRecognizer {
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(gestureRecognizer)
    gestureRecognizer.cancelsTouchesInView = false
    return gestureRecognizer
  }
  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
}

// MARK: - Animated transition

protocol FadeDismissable {
  func dismissWithFadeAnimation()
}

extension FadeDismissable where Self: UIViewController {
  func dismissWithFadeAnimation() {
    let controller = navigationController ?? self
    
    UIView.animate(
      withDuration: TimeInterval.shortAnimation,
      animations: {
        controller.view.alpha = 0
        controller.view.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
    }) { _ in
      controller.dismiss(animated: false)
    }
  }
}

/// Fixes Apple's bug with action sheet controller's warnings in runtime
extension UIAlertController {
  func pruneNegativeWidthConstraints() {
    for subView in self.view.subviews {
      for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
        subView.removeConstraint(constraint)
      }
    }
  }
}

extension UINavigationController {
  class func noNavBarController() -> UINavigationController {
    let navVC = UINavigationController()
    navVC.isNavigationBarHidden = true
    return navVC
  }
}
