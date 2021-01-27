//
//  ProxyLaunchViewModel.swift
//  AleTemplateDemo
//
//  Created by Gleb Cherkashyn on 09.06.2020.
//  Copyright (c) 2020 Gleb Cherkashyn. All rights reserved.
//

import Foundation

final class ProxyLaunchViewModel: ProxyLaunchViewModelProtocol {
  
  // MARK: - Properties

  private let router: ProxyLaunchRouter

  
  // MARK: - Initialization
  
  init(router: ProxyLaunchRouter) {
    self.router = router

  }
  
  // MARK: - Public functions
  
  func closeModule() {
    fatalError("")
  }
  
  func didAppear() {
    if UserDefaultsStorage.token != nil {
      router.openHomeModule()
    } else {
      router.openAuthorizationModule()
    }
  }

  func openHomeModule() {
    router.openHomeModule()
  }
}
