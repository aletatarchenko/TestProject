//
//  CharactersViewModel.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 27.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class CharactersViewModel: BaseTableViewViewModel, CharactersViewModelProtocol, CharactersModuleInput {

  // MARK: - Properties
  private let router: CharactersRouter
  private let text: String
  private weak var moduleOutput: CharactersModuleOutput?
  
  // MARK: - Initialization
  
  init(router: CharactersRouter,
       text: String,
       moduleOutput: CharactersModuleOutput? = nil)
  {
    self.router = router
    self.moduleOutput = moduleOutput
    self.text = text
    
    super.init()

    setupData()

  }
  
  // MARK: - Public functions
  
  override func closeModule() {
    router.close()
  }

  private func buildContent(data: [SimpleTableCellObject]) -> [TableSectionObject] {

    let localSection = TableSectionObject(
      items: data,
      header: nil,
      footer: nil
    )

    return [localSection]
  }

  private func setupData() {

    var frequencies : [Character: Int] = [:]

    let baseCounts = zip(
      text,
      repeatElement(1,count: Int.max)
    )
    frequencies = Dictionary(baseCounts, uniquingKeysWith: +)

    let data = frequencies.map {
      SimpleTableCellObject(text: "\($0) : \($1)")
    }
    updateContent(with: [TableSectionObject(items: data)])
  }
  
  // MARK: - Private functions
}
