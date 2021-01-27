//
//  HomeViewModelProtocol.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol: BaseTableViewViewModelProtocol {
    
  func closeModule()
  func fetchTextWith(_ locale: String)
}
