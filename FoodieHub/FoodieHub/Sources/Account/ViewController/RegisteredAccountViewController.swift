//
//  RegisteredAccountViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 21.05.2023.
//

import UIKit
import SnapKit

class RegisteredAccountViewController: UIViewController {
    
    private let usernameView = ConfirmationInfoView(title: "Имя пользователя:", subtitle: UserSettings.username ?? "")
    private let addressView = ConfirmationInfoView(title: "Адрес доставки:", subtitle: UserSettings.address ?? "")
    private let phoneNumberView = ConfirmationInfoView(title: "Номер телефона:", subtitle: UserSettings.phoneNumber ?? "")
    private let deliveryTimeView = ConfirmationInfoView(title: "Время доставки:", subtitle: "\(UserSettings.pickedDay ?? ""), \(UserSettings.pickedPeriod ?? "")")
    private let subscriptionPeriod = ConfirmationInfoView(title: "Срок подписки", subtitle: UserSettings.subscriptionPeriod ?? "")
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernameView, addressView, phoneNumberView, deliveryTimeView, subscriptionPeriod])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    private let backgroundImageView: UIImageView = {
        let image = UIImage(named: "avocado")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        navigationItem.backButtonDisplayMode = .minimal
    }
}

extension RegisteredAccountViewController {
    @objc private func editButtonTapped() {
        let vc = RegisterViewController()
        vc.title = "Заполните информацию"
        vc.hidesBottomBarWhenPushed = true
        vc.userInfoUpdated = { [weak self] in
            self?.usernameView.userInfoLabel = UserSettings.username
            self?.addressView.userInfoLabel = UserSettings.address
            self?.phoneNumberView.userInfoLabel = UserSettings.phoneNumber
            self?.deliveryTimeView.userInfoLabel = "\(UserSettings.pickedDay ?? ""), \(UserSettings.pickedPeriod ?? "")"
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisteredAccountViewController {
    private func configUI() {
        view.addSubview(vStackView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        makeConstrainsts()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    private func makeConstrainsts() {
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(20)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
