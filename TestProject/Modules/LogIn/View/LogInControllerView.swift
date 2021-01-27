//
//  LogInControllerView.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LogInControllerView: BaseViewControllerView {
  // MARK: - Constants
  
  // MARK: - Outlets
  @IBOutlet weak private(set) var backButton: UIButton!
  @IBOutlet weak private(set) var scrollView: UIScrollView!
  @IBOutlet private(set) weak var emailTextField: UITextField!
  @IBOutlet private(set) weak var passwordTextField: UITextField!
  @IBOutlet private(set) weak var continueButton: UIButton!

  // MARK: - LogInView requirements
  
  func setup() {
    
  }
}
