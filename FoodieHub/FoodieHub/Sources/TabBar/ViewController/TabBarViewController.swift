//
//  TabBarViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 17.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: ProductListViewController(), title: NSLocalizedString("Главная", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: CartViewController(), title: NSLocalizedString("Корзина", comment: ""), image: UIImage(systemName: "bag")!),
            createNavController(for: isRegiteredAccount(), title: NSLocalizedString("Аккаунт", comment: ""), image: UIImage(systemName: "carrot")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
    func isRegiteredAccount() -> UIViewController {
        if let account = UserSettings.username {
            return RegisteredAccountViewController()
        }
        return AccountViewController()
    }
    
    
}
