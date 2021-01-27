//
//  RootTransition.swift
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

/// Switches existing stack of controllers with new module, basically sets the new root module
/// Does nothing on `close`, because root module should not be close
class RootTransition: PushTransition {
  
  override init(animator: TransitionAnimator? = nil,
                isAnimated: Bool = true) {
    super.init(
      animator: RootTransitionAnimator(),
      isAnimated: isAnimated
    )
  }
  
  override func open(_ viewController: UIViewController) {
    guard let navVC = self.viewController?.navigationController else {
      fatalError("This type of transition requires module with navigation controller")
    }
    navVC.delegate = self
    navVC.viewControllers.insert(viewController, at: 0)
    navVC.popToRootViewController(animated: true)
  }
  
  override func close(_ viewController: UIViewController,
                      completion: VoidCallback?) {}
}
