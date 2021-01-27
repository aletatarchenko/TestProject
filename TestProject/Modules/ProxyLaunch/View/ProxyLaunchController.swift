//
//  ProxyLaunchController.swift
//  AleTemplateDemo
//
//  Created by Gleb Cherkashyn on 09.06.2020.
//  Copyright (c) 2020 Gleb Cherkashyn. All rights reserved.
//

import Foundation
import UIKit

final class ProxyLaunchController: BaseViewController<ProxyLaunchControllerView, ProxyLaunchViewModel> {

  // MARK: - Lifecycle
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    #warning("ale.t TODO: remove after adding real proxy module")
    sleep(1)
    viewModel.didAppear()
  }
}
