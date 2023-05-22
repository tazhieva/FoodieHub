//
//  CartViewCell.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit
import SnapKit

class CartViewCell: UITableViewCell {
    
    static let identifier = "CartViewCell"
    
    private let imageLoader = ImageDownloader()
    
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
        label.numberOfLines = 2
        label.text = "Яблоко Гренни Смит Франция кг"
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let cartButton = AmountButtonView(type: .cart)
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productTitleLabel, cartButton])
        stack.axis = .vertical
        stack.alignment = .firstBaseline
        return stack
    }()
    
    private lazy var productStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productImageView, vStackView])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .firstBaseline
        return stack
    }()
    
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Labels

extension CartViewCell {
    func configureLabels(product: Product) {
        
        productTitleLabel.text = product.name
        cartButton.price = product.price
        imageLoader.downloadImage(from: product.image) { [weak self] image in
            DispatchQueue.main.async {
                self?.productImageView.image = image
            }
        }
        
        cartButton.amount = product.quantity
        
        cartButton.didPressOnButton = { [weak self] item in
            switch item {
            case .plus:
                CartManager.shared.addItem(product)
                
            case .minus:
                CartManager.shared.removeItem(product)
            }
        }
    }
}


// MARK: - Configure UI

extension CartViewCell {
    private func configUI() {
        contentView.addSubview(productStackView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        productStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        productImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.2)
            make.height.equalTo(productImageView.snp.width)
        }
        
        vStackView.snp.makeConstraints { make in
            make.centerY.equalTo(productImageView.snp.centerY)
            
        }
    }
}

