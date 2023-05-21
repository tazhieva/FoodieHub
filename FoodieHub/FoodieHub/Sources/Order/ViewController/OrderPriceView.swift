//
//  OrderBottomView.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit
import SnapKit

class OrderPriceView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, priceLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    
    init(title: String, price: String, isTotal: Bool? = false) {
        titleLabel.text = title
        priceLabel.text = price
        if let isTotal = isTotal, isTotal {
            titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
            priceLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        super.init(frame: .zero)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 // MARK: - ConfigUI

extension OrderPriceView {
    private func configUI() {
        addSubview(hStackView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        hStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview()
        }
    }
}
