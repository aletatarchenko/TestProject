//
//  LocalTableCell.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SimpleTableCellObject: BaseTableCellObject {

  var text: String?
  override var type: UITableViewCell.Type {
    SimpleTableCell.self
  }
  
  init(text: String) {
    self.text = text
  }
}

final class SimpleTableCell: BaseTableCell {
    
  // MARK: - Outlets
  @IBOutlet private(set) weak var _textLabel: UILabel!

  // MARK: - Properties
  
  private var model: SimpleTableCellObject?
  
  // MARK: - Public
    
  override func configure(with object: BaseTableCellObject) {
    guard let model = object as? SimpleTableCellObject else {
      fatalError("Wrong item provided to cell")
    }
    
    self.model = model
    _textLabel.text = model.text
  }
}
