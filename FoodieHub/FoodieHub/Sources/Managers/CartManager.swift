//
//  CartManager.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 19.05.2023.
//

import Foundation

class CartManager {
    var cartItems = [Product]()

    static let shared = CartManager()

    func addItem(_ item: Product) {
        
        if let index = cartItems.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.name == item.name
        }) {
            cartItems[index].quantity = cartItems[index].quantity! + 1
        } else {
            var newItem = item
            newItem.quantity = 1
            cartItems.append(newItem)
        }
    }
    
    func removeItem(_ item: Product) {
        
        if let index = cartItems.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.name == item.name
        }) {
            if cartItems[index].quantity! > 1 {
                cartItems[index].quantity = cartItems[index].quantity! - 1
            } else {
                cartItems.remove(at: index)
            }
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
}
