//
//  HomeController.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class HomeController: BaseTableViewController<HomeControllerView, HomeViewModel> {
        
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: Actions
  
  // MARK: Private functions
  
  private func setupUI() {
    contentView.logOutButton.setAction { [weak self] _ in
      self?.viewModel.logout()
    }
  }

  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    let item = viewModel.locales[indexPath.row]
    viewModel.fetchTextWith(item)
  }
}

