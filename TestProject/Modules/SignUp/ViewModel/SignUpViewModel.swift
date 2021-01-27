//
//  SignUpViewModel.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class SignUpViewModel: SignUpViewModelProtocol, SignUpModuleInput {

  // MARK: - Properties
  private let router: SignUpRouter
  private let service: AuthorizationService
  private weak var moduleOutput: SignUpModuleOutput?
  var name: String?
  var email: String?
  var password: String?
  
  // MARK: - Initialization
  
  init(router: SignUpRouter,
       service: AuthorizationService,
       moduleOutput: SignUpModuleOutput? = nil)
  {
    self.router = router
    self.service = service
    self.moduleOutput = moduleOutput
  }
  
  // MARK: - Public functions

  func signUp() {
    guard
      let name = name,
      let email = email,
      let password = password
    else
    { return }

    let signUpModel = SignUpRequestModel(
      name: name,
      email: email,
      password: password
    )
    service.signUpWith(signUpModel) { [weak self] result in
      switch result {
      case let .success(value):
        UserDefaultsStorage.token = value.data?.accessToken
        DispatchQueue.main.async {
          self?.openHomeModule()
        }
      case let .failure(error):
        if let alert = error.alert  {
          let alertModel = AlertModel(alert: alert)
          DispatchQueue.main.async {
            self?.router.showAlert(with: alertModel)
          }
        }
      }
    }
  }

  func closeModule() {
    router.close()
  }

  func openHomeModule() {
    router.openHomeModule()
  }
  
  // MARK: - Private functions
}
