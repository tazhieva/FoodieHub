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
    
    private let payButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "mainColor")
        
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        cartItems = CartManager.shared.cartItems
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartItems = CartManager.shared.cartItems
        payButton.setTitle("Перейти к оплате \(CartManager.shared.cartTotalPrice) ₸", for: .normal)
        tableView.reloadData()
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
            make.height.equalTo(40)
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
