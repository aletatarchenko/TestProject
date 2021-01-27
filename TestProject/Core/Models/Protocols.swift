//
//  Protocols.swift
//  SnowBallCalculator
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation
import UIKit

protocol ModelConfigurable {
    associatedtype Model
    func configure(with model: Model)
}

protocol InputOutputViewModel {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
    
    init(input: Input, output: Output)
}

protocol FirestoreDocument: Codable {}

protocol AlertableError: Error {
  var alert: AlertDescribable? { get }
}

protocol AlertDescribable {
  var title: String? { get }
  var message: String? { get }
  var style: UIAlertController.Style { get }
  var actions: [AlertAction]? { get }
}

protocol Alertable {
  func showAlert(with model: AlertDescribable, presentCompletion: VoidCallback?, dismissCompletion: VoidCallback?)
  func showAlert(with model: AlertDescribable)
}
