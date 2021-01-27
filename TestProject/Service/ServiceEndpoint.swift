//
//  ServiceEndpoint.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//

import Foundation

enum ServiceEndpoint {
  case logIn(LogInRequestModel)
  case signUp(SignUpRequestModel)
  case fetchText(String)
}

extension ServiceEndpoint {

  private var baseUrl: String {
    "https://apiecho.cf"
  }

  var url: String {
    baseUrl + task
  }

  var method: Method {
    switch self {
    case .logIn, .signUp:
      return .post
    case .fetchText:
      return .get
    }
  }

  var token: String? {
    switch self {
    case .logIn, .signUp:
      return nil
    case .fetchText:
      return UserDefaultsStorage.token
    }
  }

  var data: Data? {
    let encoder = JSONEncoder()
    switch self {
    case let .logIn(model):
      return try? encoder.encode(model)
    case let .signUp(model):
      return try? encoder.encode(model)
    case .fetchText:
      return nil
    }
  }

  private var task: String {
     switch self {
     case .logIn:
      return "/api/login/"
     case .signUp:
      return "/api/signup/"
     case let .fetchText(locale):
      return "/api/get/text/?locale=\(locale)"
     }
  }
}

enum Method: String {
  case post = "POST"
  case get = "GET"
}
