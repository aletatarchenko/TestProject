//
//  BaseTableViewReusableViews.swift
//  OxygenSoftAppTemplate
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

class BaseTableCellObject: CellObject {
  
  let cellHeight: CGFloat
  
  typealias ReusableViewType = UITableViewCell.Type
  
  var type: UITableViewCell.Type {
    fatalError("Should be implemented by subclass")
  }
  
  init(height: CGFloat = UITableView.automaticDimension) {
    cellHeight = height
  }
}

class BaseTableCell: UITableViewCell, ModelConfigurable {
  typealias Model = BaseTableCellObject
  
  func configure(with _: BaseTableCellObject) {
    fatalError("Should be implemented by subclass")
  }
}

class BaseTableHeaderFooterObject: HeaderFooterObject {
  
  let headerHeight: CGFloat
  
  typealias ReusableViewType = UITableViewHeaderFooterView.Type
  
  var type: UITableViewHeaderFooterView.Type {
    fatalError("Should be implemented by subclass")
  }
  
  init(height: CGFloat) {
    headerHeight = height
  }
}

class BaseTableHeaderFooter: UITableViewHeaderFooterView, ModelConfigurable {
  typealias Model = BaseTableHeaderFooterObject
  
  func configure(with _: BaseTableHeaderFooterObject) {
    fatalError("Should be implemented by subclass")
  }
}
