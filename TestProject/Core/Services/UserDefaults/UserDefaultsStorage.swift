//
//  UserDefaultsStorage.swift
//  Guess-surprise
//
//  Created by Alexey Tatarchenko on 12.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import Foundation

struct UserDefaultsStorage {
  enum Keys: String {
    case token
  }

  @SerializedStored(Keys.token.rawValue, defaultValue: nil)
  static var token: String?
}
