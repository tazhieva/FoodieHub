//
//  AccountInfoView.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 21.05.2023.
//

import UIKit
import SnapKit

class AccountInfoView: UIView {
    
    var userInfoLabel: String?  {
        didSet {
            subtitleLabel.text = userInfoLabel
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    
    init(title: String, subtitle: String) {
        self.userInfoLabel = subtitle
        super.init(frame: .zero)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ConfigUI

extension AccountInfoView {
    private func configUI() {
        addSubview(vStackView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        vStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview()
        }
    }
}

