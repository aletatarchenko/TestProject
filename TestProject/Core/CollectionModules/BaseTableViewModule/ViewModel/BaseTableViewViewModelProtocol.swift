//
//  BaseTableViewViewModelProtocol.swift
//  BaseTableView
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import Foundation

protocol BaseTableViewViewModelProtocol: ViewModel {
    var content: [TableSectionObject] { get }

    func didTriggerViewReadyEvent()
}
