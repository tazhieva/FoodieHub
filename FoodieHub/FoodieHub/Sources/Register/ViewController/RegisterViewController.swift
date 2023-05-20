//
//  RegisterViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Заполните ниже поля"
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Подписка на еженедельную доставку свежих \nмолочных продуктов, сезонных овощей и \nфруктов🚚"
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
    
    private let saveButton: FHButton = {
        let button = FHButton(title: "Сохранить")
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [subtitleLabel, usernamefield, phoneNumber, addressField, deleveryTimeLabel, deliverySelectionView])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.setCustomSpacing(-10, after: deleveryTimeLabel)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        configUI()
    }
}

// MARK: - Actions

extension RegisterViewController {
    @objc private func saveButtonTapped() {
        guard let usernameTrimmingText = usernamefield.text?.trimmingCharacters(in: .whitespaces),
              let phoneNumberTrimmingText = phoneNumber.text?.trimmingCharacters(in: .whitespaces),
              let addressTrimmingText = addressField.text?.trimmingCharacters(in: .whitespaces),
              !usernameTrimmingText.isEmpty,
              !phoneNumberTrimmingText.isEmpty,
              !addressTrimmingText.isEmpty,
              let pickedDay = deliverySelectionView.selectedDayOfWeek,
              let pickedPeriod = deliverySelectionView.selectedDeliveryPeriod else {
            return
        }
        
        let userObject = User(username: usernameTrimmingText, phoneNumber: phoneNumberTrimmingText, address: addressTrimmingText, deliveryDay: pickedDay, deliveryPeriod: pickedPeriod)
        
        UserSettings.username = usernameTrimmingText
        UserSettings.phoneNumber = phoneNumberTrimmingText
        UserSettings.address = addressTrimmingText
        UserSettings.pickedDay = pickedDay
        UserSettings.pickedPeriod = pickedPeriod
        
        let alert = UIAlertController(title: "", message: "Ваши данные сохранились ✅", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить покупки", style: .default) { _ in
            self.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }

    @objc func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - ConfigUI

extension RegisterViewController {
    private func configUI() {
        view.addSubview(dismissButton)
        view.addSubview(titleLabel)
        view.addSubview(vStackView)
        view.addSubview(saveButton)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().inset(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(-30)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
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
