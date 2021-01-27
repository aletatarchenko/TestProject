//
//  ProxyLaunchModule.swift
//  AleTemplateDemo
//
//  Created by Gleb Cherkashyn on 09.06.2020.
//  Copyright (c) 2020 Gleb Cherkashyn. All rights reserved.
//

import Foundation
import UIKit

final class ProxyLaunchModule {
  let router: ProxyLaunchRouter
  let viewController: UIViewController
  
  private let viewModel: ProxyLaunchViewModel
  
  class func assemble() -> ProxyLaunchModule {
    self.init()
  }
  
  private init() {
    let router = ProxyLaunchRouter()
    let viewModel = ProxyLaunchViewModel(router: router)
    let viewController = ProxyLaunchController(viewModel: viewModel)
    router.viewController = viewController
    
    let navVC = UINavigationController.noNavBarController()
    navVC.viewControllers = [viewController]
    
    self.router = router
    self.viewController = navVC
    self.viewModel = viewModel
  }
}
