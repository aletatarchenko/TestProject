//
//  AppDelegate.swift
//  TestProject
//
//  Created by Alexey Tatarchenko on 24.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let proxyLaunch = ProxyLaunchModule.assemble()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = proxyLaunch.viewController
    window?.makeKeyAndVisible()

    return true
  }
}

