//
//  SignUpModule.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class SignUpModule {
  let router: SignUpRouter
  let viewController: UIViewController
  
  private let viewModel: SignUpViewModel
  
  class func assemble(output: SignUpModuleOutput? = nil) -> SignUpModule {
    self.init(output: output)
  }
  
  private init(output: SignUpModuleOutput? = nil) {
    let router = SignUpRouter()
    let service = AuthorizationServiceImp()
    let viewModel = SignUpViewModel(
      router: router,
      service: service,
      moduleOutput: output
    )
    let viewController = SignUpController(viewModel: viewModel)
    router.viewController = viewController
    
    self.router = router
    self.viewController = viewController
    self.viewModel = viewModel
  }
}
