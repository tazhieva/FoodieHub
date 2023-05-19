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
        label.text = "Заполните поля ниже для совершения заказа \nв нашем приложении🥑"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let usernameTextField = GHTextfield()
    private let phoneNumberTextField = GHTextfield()
    private let addredddTextField = GHTextfield()

    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, usernameTextField, phoneNumberTextField, addredddTextField])
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        configUI()
    }
    
    private func configUI() {
        view.addSubview(vStackView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.left.right.equalToSuperview().inset(10)
        }
    }

}
