//
//  SignUpControllerView.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class SignUpControllerView: BaseViewControllerView {
  // MARK: - Constants
  
  // MARK: - Outlets
  @IBOutlet private(set) weak var backButton: UIButton!
  @IBOutlet private(set) weak var scrollView: UIScrollView!
  @IBOutlet private(set) weak var nameTestField: UITextField!
  @IBOutlet private(set) weak var emailTextField: UITextField!
  @IBOutlet private(set) weak var passwordTextField: UITextField!
  @IBOutlet private(set) weak var continueButton: UIButton!
  
  // MARK: - SignUpView requirements

  func setup() {
    
  }
}
