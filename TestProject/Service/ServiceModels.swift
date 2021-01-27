//
//  ServiceModels.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//

import Foundation

struct SignUpRequestModel: Codable {
  let name: String
  let email: String
  let password: String
}

struct UserResponseModel: Codable {
  let uid: Int
  let name, email, accessToken: String
  let role, status, createdAt, updatedAt: Int

  enum CodingKeys: String, CodingKey {
    case uid, name, email
    case accessToken = "access_token"
    case role, status
    case createdAt = "created_at"
    case updatedAt = "updated_at"
  }
}

struct LogInRequestModel: Codable {
  let email: String
  let password: String
}

struct JsonData<T: Decodable>: Decodable {
  let data: T?
  var success: Bool
  var errors: [TestProjectError]?
}

struct TestProjectError: Codable, Error {
  let name: String?
  let message: String?
  let code: Int?
  let status: Int?
}

enum ServiceError {
  case logIn(_ error: Error)
  case signUp(_ error: Error)
  case fetchText(_ error: Error)
}

extension ServiceError: AlertableError {
  var alert: AlertDescribable? {
    switch self {
    case .signUp:
      return ModuleAlert.failedOperation
    case .logIn:
      return ModuleAlert.failedOperation
    case .fetchText:
      return ModuleAlert.failedOperation
    }
  }
}
