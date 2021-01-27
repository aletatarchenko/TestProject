//
//  DataServiceImp.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//

import Foundation

protocol DataService: RequestHelper {
  func fetchTextWith(_ locale: String,
                  callback: @escaping AlertableResultCallback<JsonData<String>>)

}

final class DataServiceImp: DataService {

  func fetchTextWith(_ locale: String,
                     callback: @escaping AlertableResultCallback<JsonData<String>>) {
    request(.fetchText(locale)) { result in
      switch result {
      case let .success(value):
        let decoder = JSONDecoder()
        do {
          let decoded = try decoder.decode(JsonData<String>.self, from: value)
          let json = try JSONSerialization.jsonObject(with: value, options: [])
          debugPrint(json)
          callback(.success(decoded))
        } catch {
          callback(.failure(ServiceError.fetchText(error)))
        }
      case let .failure(error):
        callback(.failure(ServiceError.fetchText(error)))
      }
    }
  }
}
