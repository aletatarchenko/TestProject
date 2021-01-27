//
//  LogInController.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class LogInController: BaseViewController<LogInControllerView, LogInViewModel> {
  
  // MARK: - Properties
  private lazy var keyboardObserver = KeyboardScrollViewObserver(
    scrollView: self.contentView.scrollView
  )
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - Actions

  @objc private func textPasswordDidChange(_ textField: UITextField) {
    guard let text = textField.text else { return }
    viewModel.password = text
  }
  @objc private func textEmailDidChange(_ textField: UITextField) {
    guard let text = textField.text else { return }
    viewModel.email = text
  }

  // MARK: - Private functions
  
  private func setupUI() {
    let `view` = contentView
    keyboardObserver.startObservation()

    view.emailTextField.addTarget(
      self,
      action: #selector(textEmailDidChange(_:)),
      for: .editingChanged
    )
    
    view.passwordTextField.addTarget(
      self,
      action: #selector(textPasswordDidChange(_:)),
      for: .editingChanged
    )
    view.continueButton.setAction { [weak self] _ in
      self?.viewModel.logIn()
    }
    view.backButton.setAction { [weak self] _ in
      self?.viewModel.closeModule()
    }
  }
}
