//
//  UIViewController+Extension.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 21.05.2023.
//

import UIKit

extension UIViewController {
    func openMain() {
        let vc = TabBarViewController()
        let mainTabbar = UINavigationController(rootViewController: vc)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
            window.rootViewController = vc
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.4
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
        }
    }
}
