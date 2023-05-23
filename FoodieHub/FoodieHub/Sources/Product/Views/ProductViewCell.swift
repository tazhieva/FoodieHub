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
    
    private let imageLoader = ImageDownloader()
    
    var outOfStock: ((Product) -> ())?
    
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
    
    private let cartButton = AmountButtonView(type: .list)
    
    private lazy var productStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productImageView, productTitleLabel, cartButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.layer.cornerRadius = 12
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.3
        stack.setCustomSpacing(10, after: cartButton)
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

// MARK: - Configure Labels

extension ProductViewCell {
    func configureLabels(product: Product) {
        productTitleLabel.text = product.name
        cartButton.amount = product.quantity ?? 0
        cartButton.price = product.price
        
        imageLoader.downloadImage(from: product.image) { [weak self] image in
            DispatchQueue.main.async {
                self?.productImageView.image = image
            }
        }
        
        cartButton.didPressOnButton = { [weak self] operation in
            guard let self = self else { return }
       
            switch operation {
            case .plus:
                if !product.available {
                    self.outOfStock?(product)
                    self.cartButton.amount = 0
                } else {
                    CartManager.shared.addItem(product)
                }
            case .minus:
                CartManager.shared.removeItem(product)
            }
        }
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
        productTitleLabel.snp.makeConstraints { make in
            make.width.equalTo(productImageView.snp.width).multipliedBy(0.9)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.6)
        }
    }
}
