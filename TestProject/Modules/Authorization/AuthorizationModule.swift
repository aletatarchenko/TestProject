//
//  AuthorizationModule.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class AuthorizationModule {
  let router: AuthorizationRouter
  let viewController: UIViewController
  
  private let viewModel: AuthorizationViewModel
  
  class func assemble(output: AuthorizationModuleOutput? = nil) -> AuthorizationModule {
    self.init(output: output)
  }
  
  private init(output: AuthorizationModuleOutput? = nil) {
    let router = AuthorizationRouter()
    let viewModel = AuthorizationViewModel(router: router, moduleOutput: output)
    let viewController = AuthorizationController(viewModel: viewModel)
    router.viewController = viewController
    
    self.router = router
    self.viewController = viewController
    self.viewModel = viewModel
  }
}
