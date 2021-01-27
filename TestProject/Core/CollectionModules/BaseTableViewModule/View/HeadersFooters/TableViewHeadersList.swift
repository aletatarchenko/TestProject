//
//  TableViewHeadersList.swift
//  SnowBallCalculator
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

enum TableViewHeaderFooter {

}

extension TableViewHeaderFooter {
  private var type: UITableViewHeaderFooterView.Type {
    UITableViewHeaderFooterView.self
  }
  
  var nib: UINib {
    type.nib
  }
  
  var id: String {
    type.id
  }
}

extension UITableViewHeaderFooterView {
  static var id: String {
    String(describing: self)
  }
  
  static var nib: UINib {
    UINib(nibName: id, bundle: nil)
  }
}
