//
//  ProxyLaunchRouter.swift
//  AleTemplateDemo
//
//  Created by Gleb Cherkashyn on 09.06.2020.
//  Copyright (c) 2020 Gleb Cherkashyn. All rights reserved.
//

import Foundation

final class ProxyLaunchRouter: Router, ProxyLaunchRouter.Routes  {

  // MARK: - Routes list
  typealias Routes = AuthorizationRoute & HomeRoute
  
  // MARK: - Transitions
}
