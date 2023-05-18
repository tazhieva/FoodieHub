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
            createNavController(for: ProductListViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: CartViewController(), title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "bag")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.image = image
//        navController.navigationBar.prefersLargeTitles = true

        return navController
    }
   
}
