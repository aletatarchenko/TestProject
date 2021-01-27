//
//  AuthorizationController.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class AuthorizationController: BaseViewController<AuthorizationControllerView, AuthorizationViewModel> {
  
  // MARK: - Properties
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - Actions
  
  // MARK: - Private functions
  
  private func setupUI() {
    let `view` = contentView

    view.logInButton.setAction { [weak self] _ in
      self?.viewModel.openLogIn()
    }

    view.signUpButton.setAction { [weak self] _ in
      self?.viewModel.signUpModule()
    }
  }
}
