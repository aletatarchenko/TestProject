//
//  Alertable.swift
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

struct AlertAction {
  let title: String
  let style: UIAlertAction.Style
  let handler: (() -> ())?
  
  init(title: String,
       style: UIAlertAction.Style = .default,
       handler: VoidCallback? = nil) {
    self.title = title
    self.style = style
    self.handler = handler
  }
}

struct AlertModel: AlertDescribable {
  
  let title: String?
  let message: String?
  let style: UIAlertController.Style
  var actions: [AlertAction]?
  
  init(title: String? = nil,
       message: String? = nil,
       style: UIAlertController.Style = .alert,
       actions: [AlertAction]? = nil) {
    self.style = style
    self.title = title
    self.message = message
    self.actions = actions
  }
  
  init(alert: AlertDescribable,
       style: UIAlertController.Style = .alert,
       actions: [AlertAction]? = nil) {
    self.title = alert.title
    self.message = alert.message
    self.actions = actions
    self.style = style
  }
}

extension Alertable where Self: RouterProtocol {
  func showAlert(with model: AlertDescribable,
                 presentCompletion: VoidCallback? = nil,
                 dismissCompletion: VoidCallback? = nil) {
    dispatchPrecondition(condition: .onQueue(.main))
    
    let alert = self.alert(model: model, dismissCompletion: dismissCompletion)
    viewController?.present(alert, animated: true, completion: presentCompletion)
  }
  
  func showAlert(with model: AlertDescribable) {
    dispatchPrecondition(condition: .onQueue(.main))
    
    let alert = self.alert(model: model)
    viewController?.present(alert, animated: true)
  }
  
  private func alert(model: AlertDescribable, dismissCompletion: VoidCallback? = nil) -> UIViewController {
    let alertVC = UIAlertController(
      title: model.title,
      message: model.message,
      preferredStyle: model.style
    )
    
    /// Fixes Apple's bug with constraints warnings in runtime
    if model.style == .actionSheet {
      alertVC.pruneNegativeWidthConstraints()
    }
    
    if let actions = model.actions {
      for action in actions {
        let alertAction = UIAlertAction(
          title: action.title,
          style: action.style) { _ in
            action.handler?()
        }
        alertVC.addAction(alertAction)
      }
    } else {
      let cancelAction = UIAlertAction(
        title: "Ok",
        style: .cancel,
        handler: { _ in
          dismissCompletion?()
      }
      )
      alertVC.addAction(cancelAction)
    }
    
    return alertVC
  }
}

