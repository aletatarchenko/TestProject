//
//  CharactersController.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class CharactersController: BaseTableViewController<CharactersControllerView, CharactersViewModel> {
        
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: Actions
  
  // MARK: Private functions
  
  private func setupUI() {
    contentView.closeButton.setAction { [weak self] _ in
      self?.viewModel.closeModule()
    }
  }
}
