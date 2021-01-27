//
//  ProfileModuleAlert.swift
//
//  Created by Alexey Tatarchenko on 25.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import UIKit

enum ModuleAlert: AlertDescribable {
  case failedOperation

  var title: String? {
    switch self {
    case .failedOperation:
      return "Oh no!"
    default:
      return nil
    }
  }

  var message: String? {
    switch self {
    case .failedOperation:
      return "Oh no! Something went wrong!"
    }
  }

  var style: UIAlertController.Style {
    .alert
  }

  var actions: [AlertAction]? {
    nil
  }
}

