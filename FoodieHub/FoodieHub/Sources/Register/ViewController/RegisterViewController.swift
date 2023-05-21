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
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Заполните ниже поля"
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Подписка на еженедельную доставку свежих молочных продуктов, сезонных овощей и фруктов🚚"
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
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
    
    private var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernamefield, phoneNumber, addressField, deleveryTimeLabel, deliverySelectionView])
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
    @objc func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveButtonTapped() {
        viewModel.username = usernamefield.text?.trimmingCharacters(in: .whitespaces) ?? ""
        viewModel.phoneNumber = phoneNumber.text?.trimmingCharacters(in: .whitespaces) ?? ""
        viewModel.address = addressField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        viewModel.pickedDay = deliverySelectionView.selectedDayOfWeek ?? ""
        viewModel.pickedPeriod = deliverySelectionView.selectedDeliveryPeriod ?? ""
        
        viewModel.saveUserInfo()
        
        let alert = UIAlertController(title: "", message: "Ваши данные сохранились ✅", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить покупки", style: .default) { [weak self]  _ in
            self?.dismiss(animated: true)
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
        contentView.addSubview(dismissButton)
        contentView.addSubview(headerStackView)
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
        
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().inset(20)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(30)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(10)
            make.right.left.equalToSuperview().offset(30)
            make.bottom.equalTo(saveButton.snp.top).offset(-20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).inset(30)
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

