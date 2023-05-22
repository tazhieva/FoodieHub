//
//  AccountViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit
import SnapKit

class AccountViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Добро пожаловать в FoodieHub!"
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Пройдите регистрацию для совершения заказа \nв нашем приложении🥑"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = UIColor(named: "mainColor")
        button.addTarget(self, action: #selector(didRegisterTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, registerButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButtonDisplayMode = .minimal
        configUI()
    }
}

// MARK: - Actions
extension AccountViewController {
    @objc private func didRegisterTapped() {
        let vc = RegisterViewController()
        vc.title = "Заполните информацию"
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - ConfigUI

extension AccountViewController {
    private func configUI() {
        view.addSubview(vStackView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        vStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
}
