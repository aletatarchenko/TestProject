//
//  Service.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//

import Foundation

protocol AuthorizationService: RequestHelper {
  func signUpWith(_ model: SignUpRequestModel,
                  callback: @escaping AlertableResultCallback<JsonData<UserResponseModel>>)
  func logInWith(_ model: LogInRequestModel,
                  callback: @escaping AlertableResultCallback<JsonData<UserResponseModel>>)
}

final class AuthorizationServiceImp: AuthorizationService {

  func signUpWith(_ model: SignUpRequestModel, callback: @escaping AlertableResultCallback<JsonData<UserResponseModel>>) {
    request(.signUp(model)) { result in
      switch result {
      case let .success(value):
        let decoder = JSONDecoder()
        do {
          let decoded = try decoder.decode(JsonData<UserResponseModel>.self, from: value)
          if let errors = decoded.errors,
             !errors.isEmpty,
             let error = errors.first {
            callback(.failure(ServiceError.signUp(error)))
          } else {
            callback(.success(decoded))
          }
        } catch {
          callback(.failure(ServiceError.signUp(error)))
        }
      case let .failure(error):
        callback(.failure(ServiceError.signUp(error)))
      }
    }
  }

  func logInWith(_ model: LogInRequestModel,
                callback: @escaping AlertableResultCallback<JsonData<UserResponseModel>>) {
    request(.logIn(model)) { result in
      switch result {
      case let .success(value):
        let decoder = JSONDecoder()
        do {
          let decoded = try decoder.decode(JsonData<UserResponseModel>.self, from: value)
          if let errors = decoded.errors,
             !errors.isEmpty,
             let error = errors.first {
            callback(.failure(ServiceError.logIn(error)))
          } else {
            callback(.success(decoded))
          }
        } catch {
          callback(.failure(ServiceError.logIn(error)))
        }
      case let .failure(error):
        callback(.failure(ServiceError.logIn(error)))
      }
    }
  }
}


