//
//  AuthorizationRoute.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation

protocol AuthorizationRoute {
  var authorizationModuleTransition: Transition { get }
  func openAuthorizationModule()
}

extension AuthorizationRoute where Self: RouterProtocol {

  var authorizationModuleTransition: Transition {
    RootTransition()
  }

  func openAuthorizationModule() {
    let authorizationModule = AuthorizationModule.assemble()
    let transition = authorizationModuleTransition
    authorizationModule.router.openTransition = transition
    open(authorizationModule.viewController, transition: transition)
  }
}
