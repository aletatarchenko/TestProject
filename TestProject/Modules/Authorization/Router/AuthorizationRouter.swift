//
//  AuthorizationRouter.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class AuthorizationRouter: Router, AuthorizationRouter.Routes {

  // MARK: - Routes list
  typealias Routes = SignUpRoute & LogInRoute
  
  // MARK: - Transitions
}
