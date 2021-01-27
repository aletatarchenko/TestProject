//
//  SignUpRoute.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation

protocol SignUpRoute {
  var signUpModuleTransition: Transition { get }
  func openSignUpModule()
}

extension LogInRoute where Self: RouterProtocol {

  var signUpModuleTransition: Transition {
    PushTransition()
  }

  func openSignUpModule() {
    let signUpModule = SignUpModule.assemble()
    let transition = signUpModuleTransition
    signUpModule.router.openTransition = transition
    open(signUpModule.viewController, transition: transition)
  }
}
