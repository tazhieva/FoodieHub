//
//  RegisterViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    private let viewModel = RegisterViewModel()
    
    var userInfoUpdated: (() -> Void)?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Подписка на еженедельную доставку свежих молочных продуктов, сезонных овощей и фруктов🚚"
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let usernamefield = FHTextfield(title: "Введите ваше имя")
    private let phoneNumber = FHTextfield(title: "Введите ваш номер телефона")
    private let addressField = FHTextfield(title: "Введите адресс доставки")
    
    private let deleveryTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.text = "Выберите день недели и период доставки"
        return label
    }()
    
    private let deliverySelectionView = DeliverySelectionView()
    
    private let subscriptionPeriodLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.text = "Выберите срок подписки на доставку продуктов"
        return label
    }()
    
    private let subscriptionPeriodView = SubscriptionPeriodView()
    
    private let saveButton: FHButton = {
        let button = FHButton(title: "Сохранить")
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernamefield, phoneNumber, addressField, subscriptionPeriodLabel, subscriptionPeriodView, deleveryTimeLabel, deliverySelectionView])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.setCustomSpacing(10, after: subscriptionPeriodView)
        stack.setCustomSpacing(-10, after: deleveryTimeLabel)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configUI()
    }
}

// MARK: - Actions

extension RegisterViewController {
    @objc private func saveButtonTapped() {
        viewModel.username = usernamefield.text?.trimmingCharacters(in: .whitespaces) ?? ""
        viewModel.phoneNumber = phoneNumber.text?.trimmingCharacters(in: .whitespaces) ?? ""
        viewModel.address = addressField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        viewModel.pickedDay = deliverySelectionView.selectedDayOfWeek ?? ""
        viewModel.pickedPeriod = deliverySelectionView.selectedDeliveryPeriod ?? ""
        viewModel.subscriptionPeriod = subscriptionPeriodView.selectedPeriod.title
        
        viewModel.saveUserInfo()
        
        let alert = UIAlertController(title: "", message: "Ваши данные сохранились ✅", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить покупки", style: .default) { [weak self]  _ in
            self?.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true)
        userInfoUpdated?()
    }
}

// MARK: - ConfigUI

extension RegisterViewController {
    private func configUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(vStackView)
        contentView.addSubview(saveButton)
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
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.right.left.equalToSuperview().offset(30)
            make.bottom.equalTo(saveButton.snp.top).offset(-20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        let textFields = [usernamefield, phoneNumber, addressField]
        textFields.forEach { textField in
            textField.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-60)
            }
        }
    }
}

