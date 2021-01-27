//
//  AuthorizationViewModel.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class AuthorizationViewModel: AuthorizationViewModelProtocol, AuthorizationModuleInput {

  // MARK: - Properties
  private let router: AuthorizationRouter
  private weak var moduleOutput: AuthorizationModuleOutput?
  
  // MARK: - Initialization
  
  init(router: AuthorizationRouter, moduleOutput: AuthorizationModuleOutput? = nil) {
    self.router = router
    self.moduleOutput = moduleOutput
  }
  
  // MARK: - Public functions

  func openLogIn() {
    router.openLogInModule()
  }

  func signUpModule() {
    router.openSignUpModule()
  }

  func closeModule() {
    router.close()
  }
  
  // MARK: - Private functions
}
