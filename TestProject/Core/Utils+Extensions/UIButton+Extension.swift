//
//  UIButton+Extension.swift
//
//  Created by Alexey Tatarchenko on 22.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import UIKit

extension UIView {

  @discardableResult
  func addActivityIndicator() -> UIView {
    let indicator = UIActivityIndicatorView(style: .medium)
    let indicatorContainer = UIView()
    indicatorContainer.backgroundColor = .clear
    indicatorContainer.addSubview(indicator)
    addSubview(indicatorContainer)
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicatorContainer.translatesAutoresizingMaskIntoConstraints = false
    indicatorContainer.pinEdges(to: self)
    indicator.centerXAnchor.constraint(equalTo: indicatorContainer.centerXAnchor).isActive = true
    indicator.centerYAnchor.constraint(equalTo: indicatorContainer.centerYAnchor).isActive = true
    indicator.startAnimating()
    return indicatorContainer
  }
}
