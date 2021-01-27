//
//  BaseTableViewController.swift
//  BaseTableView
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation
import UIKit

class BaseTableViewController<V: BaseTableViewControllerView, VM: BaseTableViewViewModelProtocol>: BaseViewController<V, VM>, UITableViewDelegate, UITableViewDataSource {
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - UITableViewDataSource
  
  func numberOfSections(in _: UITableView) -> Int {
    viewModel.content.count
  }
  
  func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.content[section].items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = contentItem(for: indexPath)
    guard let cell = tableView.dequeueReusableCell(withIdentifier: model.type.id) as? BaseTableCell else {
      fatalError("Unable to create cell. Nib might be not registed")
    }
    
    cell.configure(with: model)
    cell.selectionStyle = .none
    cell.showsReorderControl = false
    
    return cell
  }
  
  // MARK: - UITableViewDelegate
  
  func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
  
  func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
    
  }
  
  func tableView(_ tableView: UITableView,
                 canMoveRowAt indexPath: IndexPath) -> Bool {
    false
  }
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      .none
  }
  
  func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
      false
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let model = viewModel.content[section].header else {
      return nil
    }
    
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: model.type.id) as? BaseTableHeaderFooter
    
    header?.configure(with: model)
    
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    viewModel.content[section].header?.headerHeight ?? .zero
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    UIView()
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    .leastNormalMagnitude
  }
  
  // MARK: - Helpers
  
  func contentItem(for indexPath: IndexPath) -> BaseTableCellObject {
    viewModel
      .content[indexPath.section]
      .items[indexPath.row]
  }
  
  // MARK: - Private functions
  
  private func setupUI() {
    guard let tableView = contentView.tableView else {
      fatalError("Table view outlet is not connected")
    }
    
    for cell in contentView.usedCells {
      tableView.register(cell.nib, forCellReuseIdentifier: cell.id)
    }
    
    for header in contentView.usedHeaders {
      tableView.register(header.nib, forHeaderFooterViewReuseIdentifier: header.id)
    }
    
    tableView.delegate = self
    tableView.dataSource = self
  }
}
