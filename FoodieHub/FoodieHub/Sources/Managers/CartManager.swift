//
//  CartManager.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 19.05.2023.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    var cartItems: [Product] = []
    
    func addItem(_ item: Product) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.name == item.name }) {
            cartItems[existingItemIndex].quantity! += 1
        } else {
            var newItem = item
            newItem.quantity = 1
            cartItems.append(newItem)
        }
        saveCartItems()
    }
    
    func removeItem(_ item: Product) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.name == item.name }) {
            if cartItems[existingItemIndex].quantity ?? 0 > 1 {
                cartItems[existingItemIndex].quantity! -= 1
            } else {
                cartItems.remove(at: existingItemIndex)
            }
            saveCartItems()
        }
    }
    
    var totalItemsCount: Int {
        return cartItems.count
    }
    
    var cartTotalPrice: Int {
        var total: Int = 0
        cartItems.forEach{ total += $0.price * $0.quantity! }
        return total
    }
    
    
    private func saveCartItems() {
        do {
            let encodedData = try JSONEncoder().encode(cartItems)
            UserDefaults.standard.set(encodedData, forKey: "cartItems")
        } catch {
            print("Failed to encode cart items: \(error)")
        }
    }
    
    init() {
        if let savedCartItemsData = UserDefaults.standard.data(forKey: "cartItems") {
            do {
                cartItems = try JSONDecoder().decode([Product].self, from: savedCartItemsData)
            } catch {
                print("Failed to decode cart items: \(error)")
            }
        }
    }
}
