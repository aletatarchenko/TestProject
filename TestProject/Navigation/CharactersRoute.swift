//
//  CharactersRoute.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//

import Foundation

protocol CharactersRoute {
  var charactersModuleTransition: Transition { get }
  func openCharactersModuleWith(_ text: String)
}

extension CharactersRoute where Self: RouterProtocol {

  var charactersModuleTransition: Transition {
    ModalTransition()
  }

  func openCharactersModuleWith(_ text: String) {
    let authorizationModule = CharactersModule.assemble(text: text)
    let transition = charactersModuleTransition
    authorizationModule.router.openTransition = transition
    open(authorizationModule.viewController, transition: transition)
  }
}
