//
//  UIView+Extension.swift
//
//  Created by Alexey Tatarchenko on 16.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import UIKit

extension UIView {
  func addShadow() {
    backgroundColor = .clear
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 15.0
    layer.shadowOpacity = 0.1
    layer.shadowOffset = CGSize(width: 2, height: 2)
    layer.masksToBounds = false
  }

  func pinEdges(to other: UIView,
                side: [NSLayoutConstraint.Attribute] = [.top, .bottom, .right, .left]) {
    let attributes: [NSLayoutConstraint.Attribute] = side
    NSLayoutConstraint.activate(attributes.map {
      NSLayoutConstraint(
        item: other,
        attribute: $0,
        relatedBy: .equal,
        toItem: self,
        attribute: $0,
        multiplier: 1,
        constant: 0
      )
    })
  }

  func makeBorder(size: CGFloat, color: UIColor) {
    layer.borderColor = color.cgColor
    layer.borderWidth = size
  }

  var circleCornerRadius: CGFloat {
    let minDimension = min(bounds.height, bounds.width)
    return minDimension / 2.0
  }

  func makeСircle() {
    makeCornerRadius(circleCornerRadius)
  }

  func makeCornerRadius(_ radius: CGFloat) {
    layer.cornerRadius = radius
  }

  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(
      roundedRect: bounds,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
}
