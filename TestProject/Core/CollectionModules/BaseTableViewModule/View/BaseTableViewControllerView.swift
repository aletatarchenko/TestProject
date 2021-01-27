//
//  BaseTableViewControllerView.swift
//  BaseTableView
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation
import UIKit

class BaseTableViewControllerView: BaseViewControllerView {
  
  // MARK: - Outlets
  
  @IBOutlet private(set) weak var tableView: UITableView!
  
  // MARK: - BaseTableViewView requirements

  var usedCells: [TableViewCell] {
    fatalError("Should be implemented by subclass")
  }
  
  var usedHeaders: [TableViewHeaderFooter] { [] }
  
  func setup() {
    
  }
}
