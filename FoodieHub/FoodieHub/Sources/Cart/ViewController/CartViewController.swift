//
//  CartViewController.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 17.05.2023.
//

import UIKit
import SnapKit

class CartViewController: UIViewController {
    
    private var cartItems = [Product]()
    
    // MARK: - UI Elements
    
    private var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.allowsMultipleSelection = true
        view.register(CartViewCell.self, forCellReuseIdentifier: CartViewCell.identifier)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let containerView = UIView()
    
    private let payButton: FHButton = {
        let button = FHButton()
        button.addTarget(self, action: #selector(didPayButtonTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate let attentionImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "exclamationmark.triangle"))
        view.frame.size = CGSize(width: 20, height: 20)
        view.tintColor = .lightGray
        view.contentMode = .left
        return view
    }()
    
    fileprivate var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "Обращаем Ваше внимание, что вес у крупных овощей и фруктов может быть разным."
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [attentionImage, infoLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    
    
    private let emptyCartContainerView =  UIView()
    
    private let emptyCartLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .gray
        label.text = "Ваша корзина пуста"
        return label
    }()
    
    private let emptyCartSymbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(named: "mainColor")
        imageView.image = UIImage(systemName: "cart.badge.plus")
        return imageView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        configureTableView()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }
}

// MARK: - Actions

extension CartViewController {
    
    @objc private func didPayButtonTapped() {
        if let user = UserSettings.username {
            let vc = OrderViewController()
            vc.title = "Оформление заказа"
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        } else {
            showAlert(title: "", message: "Чтобы оформить заказ, заполните ваши контактные данные", cancelActionTitle: "Отменить", defaultActionTitle: "Заполнить") { [weak self] in
                let vc = RegisterViewController()
                vc.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

// MARK: - Methods

extension CartViewController {
    private func updateUI() {
        cartItems = CartManager.shared.cartItems
        updateEmptyCartViewVisibility()
        payButton.setTitle("Перейти к оплате \(CartManager.shared.cartTotalPrice)  ₸", for: .normal)
        tableView.reloadData()
    }
    
    private func updateEmptyCartViewVisibility() {
        if cartItems.isEmpty {
            emptyCartContainerView.isHidden = false
            containerView.isHidden = true
        } else {
            emptyCartContainerView.isHidden = true
            containerView.isHidden = false
        }
    }
}

// MARK: - Configure TableView

extension CartViewController {
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(containerView)
        containerView.addSubview(tableView)
        containerView.addSubview(infoStackView)
        containerView.addSubview(payButton)
        view.addSubview(emptyCartContainerView)
        emptyCartContainerView.addSubview(emptyCartLabel)
        emptyCartContainerView.addSubview(emptyCartSymbolImageView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
        }
        
        payButton.snp.makeConstraints { make in
            make.top.equalTo(infoStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        emptyCartContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        emptyCartLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        emptyCartSymbolImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emptyCartLabel.snp.top).offset(-16)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
    }
}

// MARK: - UITableView

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartViewCell.identifier, for: indexPath) as? CartViewCell else {
            return UITableViewCell()
        }
        
        cell.configureLabels(product: cartItems[indexPath.row])
        
        cell.updateItemsInCart = { [weak self] in
            guard let self = self else { return }
            updateUI()
        }
        
        return cell
    }
}
