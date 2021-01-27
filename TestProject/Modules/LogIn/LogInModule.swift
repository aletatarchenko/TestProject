//
//  LogInModule.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class LogInModule {
  let router: LogInRouter
  let viewController: UIViewController
  
  private let viewModel: LogInViewModel
  
  class func assemble(output: LogInModuleOutput? = nil) -> LogInModule {
    self.init(output: output)
  }
  
  private init(output: LogInModuleOutput? = nil) {
    let router = LogInRouter()
    let authorizationService = AuthorizationServiceImp()
    let viewModel = LogInViewModel(
      router: router,
      service: authorizationService,
      moduleOutput: output
    )
    let viewController = LogInController(viewModel: viewModel)
    router.viewController = viewController
    
    self.router = router
    self.viewController = viewController
    self.viewModel = viewModel
  }
}
