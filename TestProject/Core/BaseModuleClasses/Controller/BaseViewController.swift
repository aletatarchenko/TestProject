//
//  BaseGenericViewController.swift
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

/*
 Base class for all view controllers which are part of complete module (MVVM+router)
 Simple screen can be implemented using just UIViewController
 */
class BaseViewController<View: BaseViewControllerView, ViewModelType: ViewModel>: UIViewController {
  // MARK: - Properties
  
  let viewModel: ViewModelType
  let contentView: View
  
  // MARK: - Initialization
  
  init(viewModel: ViewModelType) {
    self.viewModel = viewModel
    contentView = View()
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    debugPrint("Did deinit \(String(describing: type(of: self)))")
  }
  
  // MARK: - Lifecycle
  
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    contentView.setup()
  }
}

extension BaseViewController {
  func addChild(_ child: UIViewController, to container: UIView) {
    addChild(child)
    child.view.frame = container.bounds
    child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    container.addSubview(child.view)
    child.didMove(toParent: self)
  }
  
  func remove(_ child: UIViewController) {
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}
