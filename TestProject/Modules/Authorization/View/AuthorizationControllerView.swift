//
//  AuthorizationControllerView.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class AuthorizationControllerView: BaseViewControllerView {
  // MARK: - Constants
  
  // MARK: - Outlets
  @IBOutlet private(set) weak var signUpButton: UIButton!
  @IBOutlet private(set) weak var logInButton: UIButton!

  // MARK: - AuthorizationView requirements
  
  func setup() {
    signUpButton.makeCornerRadius(8)
    logInButton.makeCornerRadius(8)
  }
}
