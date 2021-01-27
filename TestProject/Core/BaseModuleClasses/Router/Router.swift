//
//  Router.swift
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import UIKit

/*
 Gives ability to close module
 */
protocol Closable: class {
  func close(completion: VoidCallback?)
}

/*
 Gives ability to close module with all modules after current module
*/
protocol NavigationDelegate: class {
  func closeNavigationStack(completion: VoidCallback?)
}

/*
 Gives ability to delegate closing to another router
*/
protocol NavigationDelegateable: class {
  var navigationDelegate: NavigationDelegate? { get }
}

/*
 Base router protocol
 */
protocol RouterProtocol: Closable, NavigationDelegate, NavigationDelegateable {
  associatedtype V: UIViewController
  var viewController: V? { get }
  
  /*
   Trigger to present any view controller
   
   @param transition - describes how view controller should be shown
   */
  func open(_ viewController: UIViewController, transition: Transition)
}

/*
 Base router class
 Takes view controller's type as generic type
 */

class Router: RouterProtocol, NavigationDelegate {
  
  // view controller of module
  weak var viewController: UIViewController?
  private(set) weak var navigationDelegate: NavigationDelegate?
  
  // object which is responsible for navigation
  var openTransition: Transition?
  
  init(navigationDelegate: NavigationDelegate? = nil) {
    self.navigationDelegate = navigationDelegate
  }
  
  // default method to open new module
  func open(_ viewController: UIViewController, transition: Transition) {
    transition.viewController = self.viewController
    transition.open(viewController)
  }
  
  deinit {
    debugPrint("Did deinit \(String(describing: type(of: self)))")
  }
  
  // default method to close current module
  func close(completion: VoidCallback? = nil) {
    guard let openTransition = openTransition else {
      assertionFailure("You should specify an open transition in order to close a module.")
      return
    }
    guard let viewController = viewController else {
      assertionFailure("Nothing to close.")
      return
    }
    openTransition.close(viewController, completion: completion)
  }
  
  // Delegates closing to previous router in modules hierarchy if possible
  func closeNavigationStack(completion: VoidCallback? = nil) {
    guard let delegate = navigationDelegate else {
      close(completion: completion)
      return
    }
    delegate.closeNavigationStack(completion: completion)
  }
}
