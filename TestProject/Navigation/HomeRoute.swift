//
//  HomeRoute.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//

import Foundation

protocol HomeRoute {
  var homeModuleTransition: Transition { get }
  func openHomeModule()
}

extension HomeRoute where Self: RouterProtocol {

  var homeModuleTransition: Transition {
    RootTransition()
  }

  func openHomeModule() {
    let authorizationModule = HomeModule.assemble()
    let transition = homeModuleTransition
    authorizationModule.router.openTransition = transition
    open(authorizationModule.viewController, transition: transition)
  }
}
