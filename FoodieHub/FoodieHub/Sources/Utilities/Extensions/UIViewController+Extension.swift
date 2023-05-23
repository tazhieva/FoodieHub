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
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
            window.rootViewController = vc
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.4
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
        }
    }
    
    func showAlert(title: String, message: String, cancelActionTitle: String? = "", defaultActionTitle: String? = "Ок", defaultActionHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel)
        alert.addAction(cancelAction)
        
        let defaultAction = UIAlertAction(title: defaultActionTitle, style: .default) { _ in
            defaultActionHandler?()
        }
        alert.addAction(defaultAction)
        
        present(alert, animated: true)
    }
    
    func showAlertWithNoAction(title: String, message: String, defaultActionTitle: String? = "Ок") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionTitle, style: .default)
        alert.addAction(defaultAction)
        
        present(alert, animated: true)
    }
}
