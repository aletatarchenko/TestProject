//
//  LogInRoute.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation

protocol LogInRoute {
  var logInModuleTransition: Transition { get }
  func openLogInModule()
}

extension LogInRoute where Self: RouterProtocol {

  var logInModuleTransition: Transition {
    PushTransition()
  }

  func openLogInModule() {
    let logInModule = LogInModule.assemble()
    let transition = logInModuleTransition
    logInModule.router.openTransition = transition
    open(logInModule.viewController, transition: transition)
  }
}
