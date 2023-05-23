//
//  ProductListViewModel.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 23.05.2023.
//

// ProductListViewModel.swift

import Foundation

class ProductListViewModel {
    
    var products: [Product] = []
    private var categorizedProducts: [[Product]] = []
    
    func fetchProducts(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            self.products = MockData.products
            self.categorizedProducts = self.categorizeProducts()
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    private func categorizeProducts() -> [[Product]] {
        var categories: [String] = []
        var categorizedProducts: [[Product]] = []
        
        for product in products {
            if !categories.contains(product.category) {
                categories.append(product.category)
            }
        }
        
        for category in categories {
            let filteredProducts = products.filter { $0.category == category }
            categorizedProducts.append(filteredProducts)
        }
        
        return categorizedProducts
    }
    
    func numberOfSections() -> Int {
        return categorizedProducts.count
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return categorizedProducts[section].count
    }
    
    func product(at indexPath: IndexPath) -> Product {
        return categorizedProducts[indexPath.section][indexPath.item]
    }
    
    func categoryName(forSection section: Int) -> String {
        return categorizedProducts[section][0].category
    }
}
