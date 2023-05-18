//
//  ProductViewCelll.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit
import SnapKit

class ProductViewCell: UICollectionViewCell {
    
    static let identifier = "ProductViewCell"
    
    // MARK: - UI Elements
    
    private let productImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "productImage")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 0
        label.text = "Яблоко Гренни Смит Франция кг"
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let productCostLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        label.text = "1 260 ₸/кг"
        return label
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productCostLabel, cartButton])
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.backgroundColor = UIColor(named: "cellColor")
        stack.layer.cornerRadius = 12
        return stack
    }()
    
    private lazy var productStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productImageView, productTitleLabel, hStack])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.layer.cornerRadius = 12
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.3
        return stack
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI

extension ProductViewCell {
    private func configUI() {
        contentView.addSubview(productStackView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        productStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
            make.height.equalTo(productImageView.snp.width).multipliedBy(1.3)
        }
        
        hStack.snp.makeConstraints { make in
            make.width.equalTo(productImageView.snp.width).multipliedBy(0.8)
            make.height.equalTo(30)
        }
        productCostLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
        }
        
    }
}
