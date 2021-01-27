//
//  UICollection.swift
//  Guess-surprise
//
//  Created by Alexey Tatarchenko on 12.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import UIKit

extension UICollectionView {

  func setDelegate<D: Any>(_ d: D) where D: UICollectionViewDelegate {
    delegate = d
  }

  func setDataSource<D: Any>(_ d: D) where D: UICollectionViewDataSource {
    dataSource = d
  }

  func removeDelegate() {
    delegate = nil
  }
  func removeDataSource() {
    dataSource = nil
  }
}

extension UITableView {

  func setDelegate<D: Any>(_ d: D) where D: UITableViewDelegate {
    delegate = d
  }

  func setDataSource<D: Any>(_ d: D) where D: UITableViewDataSource {
    dataSource = d
  }

  func removeDelegate() {
    delegate = nil
  }
  func removeDataSource() {
    dataSource = nil
  }

  func removeFooter() {
    tableFooterView = UIView()
  }
}
