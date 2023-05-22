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
        cartItems = CartManager.shared.cartItems
        updateEmptyCartViewVisibility()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartItems = CartManager.shared.cartItems
        payButton.setTitle("Перейти к оплате \(CartManager.shared.cartTotalPrice) ₸", for: .normal)
        tableView.reloadData()
        updateEmptyCartViewVisibility()
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
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

// MARK: - Methods

extension CartViewController {
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
        
        payButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(20)
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
        
        return cell
    }
}
