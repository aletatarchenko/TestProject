//
//  CharactersModule.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class CharactersModule {
  let router: CharactersRouter
  let viewController: CharactersController
  
  private let viewModel: CharactersViewModel
    
  class func assemble(output: CharactersModuleOutput? = nil, text: String) -> CharactersModule {
    self.init(output: output, text: text)
  }
  
  private init(output: CharactersModuleOutput? = nil, text: String) {
    let router = CharactersRouter()
    let viewModel = CharactersViewModel(
      router: router,
      text: text,
      moduleOutput: output
    )
    let viewController = CharactersController(viewModel: viewModel)
    router.viewController = viewController
    
    self.router = router
    self.viewController = viewController
    self.viewModel = viewModel
  }
}
