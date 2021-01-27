//
//  BaseTableViewViewModel.swift
//  BaseTableView
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation

class BaseTableViewViewModel: BaseTableViewViewModelProtocol {
  
  private(set) var content: [TableSectionObject] = []
  
  func updateContent(with content: [TableSectionObject]) {
    self.content = content
  }
  
  func moveItem(from fromIndex: Int,
                to toIndex: Int,
                in section: Int) {
    var tmpContent = content
    
    let item = content[section].items[fromIndex]
    let tmpSection = content[section]
    var tmpItems = tmpSection.items
    
    tmpItems.remove(at: fromIndex)
    tmpItems.insert(item, at: toIndex)
    
    let newSection = TableSectionObject(
      items: tmpItems,
      header: tmpSection.header,
      footer: tmpSection.footer
    )
    
    tmpContent.remove(at: section)
    tmpContent.insert(newSection, at: section)
    
    content = tmpContent
  }
  
  func didTriggerViewReadyEvent() {
    fatalError("Should be implemented by subclass")
  }
  
  func closeModule() {
    fatalError("Should be implemented by subclass")
  }
}
