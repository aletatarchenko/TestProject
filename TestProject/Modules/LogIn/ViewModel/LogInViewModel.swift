//
//  LogInViewModel.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class LogInViewModel: LogInViewModelProtocol, LogInModuleInput {
    
  // MARK: - Properties
  private let router: LogInRouter
  private weak var moduleOutput: LogInModuleOutput?
  private let service: AuthorizationService
  var email: String?
  var password: String?

  // MARK: - Initialization
  
  init(router: LogInRouter,
       service: AuthorizationService,
       moduleOutput: LogInModuleOutput? = nil)
  {
    self.router = router
    self.service = service
    self.moduleOutput = moduleOutput
  }
  
  // MARK: - Public functions

  func logIn() {
    guard
      let email = email,
      let password = password
    else
    { return }

    let logInModel = LogInRequestModel(
      email: email,
      password: password
    )
    service.logInWith(logInModel) { [weak self] result in
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
