//
//  UIViewController+Extension.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 21.05.2023.
//

import UIKit

extension UIViewController {
    func openRegisterVC() {
        let vc = RegisterViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
}
