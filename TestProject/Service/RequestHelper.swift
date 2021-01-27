//
//  RequestHelper.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//

import Foundation

enum TestProjectResult<T> {
  case success(_ :T)
  case failure(_ :AlertableError)
}

protocol RequestHelper {}

extension RequestHelper {
   func request(_ endpoint: ServiceEndpoint, completion: @escaping HTTPCallback) {
    let session: URLSession

    if let token = endpoint.token {
      let authValue = "Bearer \(token)"
      let sessionConfig = URLSessionConfiguration.default
      sessionConfig.httpAdditionalHeaders = ["Authorization": authValue]
      session = URLSession(configuration: sessionConfig, delegate: self as? URLSessionDelegate, delegateQueue: nil)
    }
    else {
      session = URLSession.shared
    }

    let url = URL(string: endpoint.url)!
    var request = URLRequest(url: url)
    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
    request.httpMethod = endpoint.method.rawValue
    request.httpBody = endpoint.data
    session.dataTask(with: request) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }

      if let data = data {
        completion(.success(data))
        return
      }
      completion(.failure(NSError(domain: "Unexpected error", code: 0)))
    }
    .resume()
  }
}
