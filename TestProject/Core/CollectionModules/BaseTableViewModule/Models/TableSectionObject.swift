//
//  SectionObject.swift
//  OxygenSoftAppTemplate
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

class TableSectionObject: SectionObject<BaseTableCellObject, BaseTableHeaderFooterObject> {}

extension UITableViewCell {
    static var id: String {
        String(describing: self)
    }

    static var nib: UINib {
        UINib(nibName: id, bundle: nil)
    }
}
