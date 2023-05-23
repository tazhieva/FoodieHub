//
//  AddButton.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit

class AmountButtonView: UIView {
    
    var price: Int? {
        didSet {
            productCostLabel.text = "\(price ?? 0) ₸"
        }
    }
    
    var amount: Int? {
        didSet {
            productAmount.text = "\(amount ?? 0)"
            updateUI()
        }
    }
    
    var cartButtonType: CartButtonType
    var didPressOnButton: ((AmountButtonOperations) -> Void)?
    
    private let productCostLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let cartAddButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let cartRemoveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let productAmount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productCostLabel, cartRemoveButton, productAmount, cartAddButton])
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 5
        stack.backgroundColor = UIColor(named: "cellColor")
        stack.layer.cornerRadius = 12
        return stack
    }()
    
    init(type: CartButtonType) {
        self.cartButtonType = type
        super.init(frame: .zero)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions
extension AmountButtonView {
    @objc private func addButtonTapped() {
        guard var currentAmount = amount, currentAmount >= 0 else {
            return
        }
        
        currentAmount += 1
        amount = currentAmount
        updateUI()
        
        didPressOnButton?(.plus)
    }
    
    @objc private func removeButtonTapped() {
        guard var currentAmount = amount, currentAmount > 0 else {
            return
        }
        
        currentAmount -= 1
        amount = currentAmount
        updateUI()
        didPressOnButton?(.minus)
    }
}

// MARK: - Private Methods

extension AmountButtonView {
    private func updateUI() {
        if let currentAmount = amount {
            productAmount.text = "\(currentAmount)"
            
            if currentAmount > 0 {
                productCostLabel.isHidden = true
                cartRemoveButton.isHidden = false
                productAmount.isHidden = false
            } else {
                productCostLabel.isHidden = false
                cartRemoveButton.isHidden = true
                productAmount.isHidden = true
            }
        }
    }
}

// MARK: - Configure UI

extension AmountButtonView {
    private func configUI() {
        addSubview(hStack)
        makeConstraints()
        
        switch cartButtonType {
        case .cart:
            productCostLabel.isHidden = true
            cartRemoveButton.isHidden = false
            productAmount.isHidden = false
            
        case .list:
            productCostLabel.isHidden = false
            cartRemoveButton.isHidden = true
            productAmount.isHidden = true
        }
    }
    
    private func makeConstraints() {
        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        
        productCostLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
        }
        productAmount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
}
