//
//  ProductListVC.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit
import SnapKit

class ProductListViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let imageLoader = ImageDownloader()
    
    var cartItems: [CartItem] = []
    
    var cartManager = CartManager()

    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        return flowLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: ProductViewCell.identifier)
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ProductListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductViewCell.identifier, for: indexPath) as? ProductViewCell else {
            return UICollectionViewCell()
        }
        
        imageLoader.downloadImage(from: MockData.products[indexPath.row].image) { [weak self] image in
            DispatchQueue.main.async {
                cell.productImage = image
            }
        }
        
        cell.configureLabels(product: MockData.products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        let height: CGFloat = 300
        return CGSize(width: width, height: height)
    }
}

