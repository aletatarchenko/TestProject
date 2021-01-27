//
//  TableViewCellsList.swift
//  OxygenSoftAppTemplate
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

enum TableViewCell {
  case local
}

extension TableViewCell {
  private var type: UITableViewCell.Type {
    switch self {
    case .local:
      return SimpleTableCell.self
    }
  }
  
  var nib: UINib {
    type.nib
  }
  
  var id: String {
    type.id
  }
}
