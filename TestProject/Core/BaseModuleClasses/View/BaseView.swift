//
//  BaseView.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

/*
 Base class for custom reusable views implemented in xib files
 All view controller's views are inherited from BaseView
 */
class BaseView: UIView {
  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  deinit {
    debugPrint("Did deinit \(String(describing: type(of: self)))")
  }

  // MARK: - Private functions

  private func setup() {
    // Initialization of file owner
    let xibName = String(describing: type(of: self))
    let nib = UINib(nibName: xibName, bundle: nil)
    guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }

    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
  }
}
