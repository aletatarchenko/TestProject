//
//  Transition.swift
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

/*
 Describes entity which is responsible for navigation between view controllers
 */
protocol Transition: AnyObject {
  var viewController: UIViewController? { get set }

  func open(_ viewController: UIViewController)
  func close(_ viewController: UIViewController, completion: VoidCallback?)
}
