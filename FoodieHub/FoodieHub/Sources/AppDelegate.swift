//
//  AppDelegate.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 17.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configUI()

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let home = TabBarViewController()
        home.selectedIndex = 0
        window?.rootViewController = home
        window?.makeKeyAndVisible()

        return true
    }
    
    func configUI() {
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().layer.shadowColor = UIColor.lightGray.cgColor
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().backItem?.backButtonDisplayMode = .minimal
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "navbarBack")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "navbarBack")
    }
}
