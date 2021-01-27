//
//  BaseViewModel.swift
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation

/*
 Abstraction for all view models in project
 */
protocol ViewModel: AnyObject {
  
  /// Closes module which owns current view model
  func closeModule()
}
