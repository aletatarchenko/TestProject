//
//
//  Created by Gleb Cherkashyn on 09.12.2019.
//  Copyright © 2019 Gleb Cherkashyn. All rights reserved.
//

import UIKit

final class KeyboardConstraintObserver {
  
  private let keyboardObserver: KeyboardObserver
  private let defaultConstraintValue: CGFloat
  private unowned var view: UIView
  private unowned var constraint: NSLayoutConstraint

  init(constraint: NSLayoutConstraint,
       defaultValue: CGFloat,
       view: UIView) {
    self.constraint = constraint
    self.defaultConstraintValue = defaultValue
    self.view = view
    keyboardObserver = KeyboardObserver()
  }
  
  func startObservation() {
    keyboardObserver.observe { [weak self] event in
      guard let `self` = self else { return }
      let keyboardFrameEnd = event.keyboardFrameEnd
      
      let value: CGFloat
      switch event.type {
      case .willShow, .didShow:
        value = self.defaultConstraintValue + keyboardFrameEnd.height
        self.animate(event, constraintValue: value)
      case .willHide, .didHide:
        value = self.defaultConstraintValue
        self.animate(event, constraintValue: value)
      default:
        break
      }
    }
  }
  
  private func animate(_ event: KeyboardEvent,
                       constraintValue: CGFloat) {
    UIView.animate(
      withDuration: event.duration,
      delay: 0.0,
      options: [event.options],
      animations: { () -> Void in
        self.constraint.constant = constraintValue
        self.view.layoutIfNeeded()
    }, completion: nil)
  }
}

