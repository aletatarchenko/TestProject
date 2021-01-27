//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 26.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class HomeViewModel: BaseTableViewViewModel, HomeViewModelProtocol, HomeModuleInput {

  // MARK: - Properties
  private let router: HomeRouter
  private weak var moduleOutput: HomeModuleOutput?
  private var dataService: DataService
  
  // MARK: - Initialization
  
  init(router: HomeRouter,
       dataService: DataService,
       moduleOutput: HomeModuleOutput? = nil)
  {
    self.router = router
    self.moduleOutput = moduleOutput
    self.dataService = dataService
    
    super.init()

    setupData()
  }
  
  // MARK: - Public functions
  
  override func closeModule() {
    router.close()
  }

  func logout() {
    UserDefaultsStorage.token = nil
    router.openAuthorizationModule()
  }

  func fetchTextWith(_ locale: String) {
    dataService.fetchTextWith(locale) { [weak self] result in
      switch result {
      case let .success(value):
        guard let data = value.data else { return }
        DispatchQueue.main.async {
          self?.router.openCharactersModuleWith(data)
        }
      case let .failure(error):
        debugPrint("[FETCH TEXT ERROR]: \(error)")
      }
    }
  }
  // MARK: - Private functions

  private func buildContent(data: [SimpleTableCellObject]) -> [TableSectionObject] {

    let localSection = TableSectionObject(
      items: data,
      header: nil,
      footer: nil
    )

    return [localSection]
  }

  private func setupData() {

    let data = locales.map {
      SimpleTableCellObject(text: $0)
    }
    updateContent(with: [TableSectionObject(items: data)])
  }


  let locales =
    [
      "bg_BG", "da_DK", "el_GR", "en_NG", "en_ZA", "fi_FI", "he_IL", "ka_GE", "me_ME", "nl_NL", "pt_PT", "sr_Cyrl_RS", "tr_TR", "zh_TW", "ar_JO", "en_AU", "en_NZ", "es_AR", "hr_HR", "kk_KZ", "ro_MD", "sr_Latn_RS", "uk_UA", "ar_SA", "bn_BD", "de_AT", "en_CA", "en_PH", "es_ES", "fr_BE", "is_IS", "ko_KR", "mn_MN", "ro_RO", "sr_RS", "at_AT", "de_CH", "en_GB", "en_SG", "es_PE", "fr_CA", "hu_HU", "it_CH", "nb_NO", "ru_RU", "sv_SE", "de_DE", "en_HK", "en_UG", "es_VE", "fr_CH", "hy_AM", "it_IT", "lt_LT", "ne_NP", "pl_PL", "sk_SK", "vi_VN", "cs_CZ", "el_CY", "en_IN", "en_US", "fa_IR", "fr_FR", "id_ID", "ja_JP", "lv_LV", "nl_BE", "pt_BR", "sl_SI", "th_TH", "zh_CN"
    ]
}


