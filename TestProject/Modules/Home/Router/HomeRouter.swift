//
//  HomeRouter.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class HomeRouter: Router, HomeRouter.Routes {

  // MARK: - Routes list
  typealias Routes = CharactersRoute & AuthorizationRoute
  
  // MARK: - Transitions
}
