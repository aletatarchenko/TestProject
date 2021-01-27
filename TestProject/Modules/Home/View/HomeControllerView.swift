//
//  HomeControllerView.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class HomeControllerView: BaseTableViewControllerView {
    
  // MARK: - Outlets
  
  @IBOutlet private(set) weak var logOutButton: UIButton!
  // MARK: - HomeView requirements

  override var usedCells: [TableViewCell] {
    [TableViewCell.local]
  }
}
