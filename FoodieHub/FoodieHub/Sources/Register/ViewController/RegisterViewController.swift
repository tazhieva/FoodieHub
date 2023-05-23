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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollContentView: UIView = {
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
    private let addressField = FHTextfield(title: "Введите адрес доставки")
    
    private let phoneNumberField: FHTextfield = {
        let field = FHTextfield(title: "Введите ваш номер телефона")
        field.applyPhoneNumberFormatting = true
        return field
    }()
    
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
        let stack = UIStackView(arrangedSubviews: [usernamefield, phoneNumberField, addressField, subscriptionPeriodLabel, subscriptionPeriodView, deleveryTimeLabel, deliverySelectionView])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.setCustomSpacing(20, after: subscriptionPeriodView)
        stack.setCustomSpacing(-10, after: deleveryTimeLabel)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configUI()
        setupActions()
        validateFields()
    }
}

// MARK: - Actions

extension RegisterViewController {
    @objc private func saveButtonTapped() {
        guard let username = usernamefield.text?.trimmingCharacters(in: .whitespaces),
              let phoneNumber = phoneNumberField.text?.trimmingCharacters(in: .whitespaces),
              let address = addressField.text?.trimmingCharacters(in: .whitespaces),
              let pickedDay = deliverySelectionView.selectedDayOfWeek,
              let pickedPeriod = deliverySelectionView.selectedDeliveryPeriod,
              let subscriptionPeriod = subscriptionPeriodView.selectedPeriod?.title else {
            return
        }
 
        viewModel.username = username
        viewModel.phoneNumber = phoneNumber
        viewModel.address = address
        viewModel.pickedDay = pickedDay
        viewModel.pickedPeriod = pickedPeriod
        viewModel.subscriptionPeriod = subscriptionPeriod
        
        viewModel.saveUserInfo()
        
        let alert = UIAlertController(title: "", message: NSLocalizedString("Ваши данные сохранились ✅", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Продолжить покупки", comment: ""), style: .default) { [weak self]  _ in
            self?.openMain()
        })
        present(alert, animated: true)
    }
}

 // MARK: - Field Validation

extension RegisterViewController {
    private func setupActions() {
        usernamefield.onValueChange = { [weak self] field in
            self?.validateUsernameField(field)
            self?.validateFields()
        }
        
        phoneNumberField.onValueChange = { [weak self] field in
            self?.validatePhoneNumberField(field)
            self?.validateFields()
        }
        
        addressField.onValueChange = { [weak self] field in
            self?.validateAddressField(field)
            self?.validateFields()
        }
    }
    
    private func validateUsernameField(_ field: FHTextfield) {
        if let text = usernamefield.text, text.isEmpty {
            field.showError()
        } else {
            field.hideError()
        }
    }
    
    private func validatePhoneNumberField(_ field: FHTextfield) {
        if let text = phoneNumberField.text, text.isEmpty, phoneNumberField.text?.textWithoutPhoneMask.count ?? 0 != 11 {
            field.showError()
        } else {
            field.hideError()
        }
    }
    
    private func validateAddressField(_ field: FHTextfield) {
        if let text = addressField.text, text.isEmpty {
            field.showError()
        } else {
            field.hideError()
        }
    }
    
    private func validateFields() {
        let isUsernameValid = !(usernamefield.text?.isEmpty ?? true)
        let isPhoneNumberValid = !(phoneNumberField.text?.isEmpty ?? true) && (phoneNumberField.text?.textWithoutPhoneMask.count ?? 0) == 11
        let isAddressValid = !(addressField.text?.isEmpty ?? true)

        saveButton.setDisabled(!(isUsernameValid && isPhoneNumberValid && isAddressValid))

    }
}

// MARK: - ConfigUI

extension RegisterViewController {
    private func configUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(titleLabel)
        scrollContentView.addSubview(vStackView)
        scrollContentView.addSubview(saveButton)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollContentView.safeAreaLayoutGuide.snp.top).inset(10)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.right.left.equalToSuperview().offset(30)
            make.bottom.equalTo(saveButton.snp.top).offset(-20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(scrollContentView.safeAreaLayoutGuide.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        let textFields = [usernamefield, phoneNumberField, addressField]
        textFields.forEach { textField in
            textField.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-60)
            }
        }
    }
}
