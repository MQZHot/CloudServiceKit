//
//  AppDelegate.swift
//  CloudServiceKitExample
//
//  Created by alexiscn on 2021/9/18.
//

import UIKit
import OAuthSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if options[.sourceApplication] as? String == "com.apple.SafariViewService" {
            print("hahaha")
        }
        if url.host == "oauth-callback" {
            OAuthSwift.handle(url: url)
            return true
        } else {
            OAuthSwift.handle(url: url)
            return true
        }
    }
}

