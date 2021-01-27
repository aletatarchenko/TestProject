//
//  HomeModule.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class HomeModule {
  let router: HomeRouter
  let viewController: HomeController
  
  private let viewModel: HomeViewModel
    
  class func assemble(output: HomeModuleOutput? = nil) -> HomeModule {
    self.init(output: output)
  }
  
  private init(output: HomeModuleOutput? = nil) {
    let router = HomeRouter()
    let dataService = DataServiceImp()
    let viewModel = HomeViewModel(
      router: router,
      dataService: dataService,
      moduleOutput: output
    )
    let viewController = HomeController(viewModel: viewModel)
    router.viewController = viewController
    
    self.router = router
    self.viewController = viewController
    self.viewModel = viewModel
  }
}
