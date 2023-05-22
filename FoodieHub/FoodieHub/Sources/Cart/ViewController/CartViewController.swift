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
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let payButton: FHButton = {
        let button = FHButton(title: "Перейти к оплате \(CartManager.shared.cartTotalPrice) ₸")
        button.addTarget(self, action: #selector(didPayButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        configureTableView()
        cartItems = CartManager.shared.cartItems
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartItems = CartManager.shared.cartItems
        payButton.setTitle("Перейти к оплате \(CartManager.shared.cartTotalPrice) ₸", for: .normal)
        tableView.reloadData()
        print("CART ITEMS - \(cartItems)")
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
            let alert = UIAlertController(title: "", message: "Чтобы оформить заказ, заполните ваши контактные данные", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Отменить", style: .cancel))
            alert.addAction(UIAlertAction(title: "Заполнить", style: .default) {[ weak self]_ in
                let vc = RegisterViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            self.present(alert, animated: true)
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
