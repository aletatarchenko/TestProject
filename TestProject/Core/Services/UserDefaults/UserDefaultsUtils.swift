//
//  UserDefaultsUtils.swift
//  Guess-surprise
//
//  Created by Alexey Tatarchenko on 12.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultValue<T> {
  private let key: String
  private let defaultValue: T

  init(_ key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  var wrappedValue: T {
    get {
      UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}

@propertyWrapper
struct OptionalUserDefaultValue<T> {
  private let key: String
  private let defaultValue: T?

  init(_ key: String, defaultValue: T?) {
    self.key = key
    self.defaultValue = defaultValue
  }

  var wrappedValue: T? {
    get {
      UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}

@propertyWrapper
struct SerializedStored<T: Codable> {
  private let key: String
  private let defaultValue: T

  // MARK: - LifeCycle

  init(_ key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  var wrappedValue: T {
    get {
      let decoder = JSONDecoder()

      if let objectSting = UserDefaults.standard.string(forKey: key),
        let data = objectSting.data(using: .utf8),
        let object = try? decoder.decode(T.self, from: data) {
        return object
      }

      return defaultValue
    }
    set {
      let encoder = JSONEncoder()

      if let objectData = try? encoder.encode(newValue),
        let stringFromData = String(bytes: objectData, encoding: .utf8) {
        UserDefaults.standard.set(stringFromData, forKey: key)
      } else {
        UserDefaults.standard.removeObject(forKey: key)
      }
    }
  }
}
