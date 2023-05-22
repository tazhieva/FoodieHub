//
//  OrderViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit
import SnapKit

class OrderViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let usernameView = ConfirmationInfoView(title: "Имя пользователя:", subtitle: UserSettings.username ?? "")
    private let addressView = ConfirmationInfoView(title: "Адрес доставки:", subtitle: UserSettings.address ?? "")
    private let phoneNumberView = ConfirmationInfoView(title: "Номер телефона:", subtitle: UserSettings.phoneNumber ?? "")
    private let deliveryTimeView = ConfirmationInfoView(title: "Время доставки:", subtitle: "\(UserSettings.pickedDay ?? ""), \(UserSettings.pickedPeriod ?? "")")
    
    private let commentToOrderField = FHTextfield(title: "Комментарий к заказу")
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernameView, addressView, phoneNumberView, deliveryTimeView, commentToOrderField])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let productPriceView = OrderPriceView(title: "Продукты:", price: "\(CartManager.shared.cartTotalPrice) ₸")
    private let orderPriceView = OrderPriceView(title: "Стоимость доставки:", price: "Бесплатная доставка")
    private let totalPrice = OrderPriceView(title: "Итого:", price: "\(CartManager.shared.cartTotalPrice) ₸", isTotal: true)
    
    private let confirmButton: FHButton = {
        let button = FHButton(title: "Подтвердить заказ")
        return button
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productPriceView, orderPriceView, totalPrice, confirmButton])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(named: "cellColor")
        stack.layer.cornerRadius = 15
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        configUI()
    }
}

// MARK: - Actions
extension OrderViewController {
    @objc private func editButtonTapped() {
        let vc = RegisterViewController()
        vc.title = "Заполните информацию"
        vc.userInfoUpdated = { [weak self] in
            self?.usernameView.userInfoLabel = UserSettings.username
            self?.addressView.userInfoLabel = UserSettings.address
            self?.phoneNumberView.userInfoLabel = UserSettings.phoneNumber
            self?.deliveryTimeView.userInfoLabel = "\(UserSettings.pickedDay ?? "Четверг"), \(UserSettings.pickedPeriod ?? "13:00-15:00")"
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - ConfigUI

extension OrderViewController {
    private func configUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoStackView)
        contentView.addSubview(bottomStackView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(editButtonTapped))
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
            
        }
        
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(30)
        }
        
        commentToOrderField.snp.makeConstraints { make in
            make.width.equalTo(confirmButton.snp.width)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(totalPrice.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.height.equalTo(50)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(infoStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.equalTo(200)
        }
    }
}
