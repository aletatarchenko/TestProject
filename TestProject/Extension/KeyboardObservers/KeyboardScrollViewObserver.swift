//
//
//  Created by Gleb Cherkashyn on 09.12.2019.
//  Copyright © 2019 Gleb Cherkashyn. All rights reserved.
//

import UIKit

final class KeyboardScrollViewObserver {
  
  private let keyboardObserver: KeyboardObserver
  private unowned var scrollView: UIScrollView

  init(scrollView: UIScrollView) {
    self.scrollView = scrollView
    keyboardObserver = KeyboardObserver()
  }
  
  func startObservation() {
    keyboardObserver.observe { [weak self] event in
      guard let `self` = self else { return }
      let scrollView = self.scrollView
      let keyboardFrameEnd = event.keyboardFrameEnd(to: scrollView)
      let animFrame = scrollView.frame
      let bottom = animFrame.height - keyboardFrameEnd.minY + 10 + self.scrollView.contentOffset.y
      var contentInset = scrollView.contentInset
      contentInset.bottom = max(bottom, 0.0)
      UIView.animate(withDuration: event.duration, delay: 0.0, options: [event.options], animations: { () -> Void in
          scrollView.contentInset = contentInset
      }, completion: nil)
    }
  }
}
