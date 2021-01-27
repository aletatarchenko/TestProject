//
//  CollectionModulesModels.swift
//  OxygenSoftAppTemplate
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

class SectionObject<C: CellObject, H: HeaderFooterObject> {
  var items: [C]
  var header: H?
  var footer: H?
  
  init(items: [C], header: H? = nil, footer: H? = nil) {
    self.items = items
    self.header = header
    self.footer = footer
  }
}

protocol ReusableViewObject {
  associatedtype ReusableViewType
  
  var type: ReusableViewType { get }
}

protocol CellObject: ReusableViewObject {}

protocol HeaderFooterObject: ReusableViewObject {}

extension UICollectionReusableView {
  static var id: String {
    String(describing: self)
  }
  
  static var nib: UINib {
    UINib(nibName: id, bundle: nil)
  }
}
