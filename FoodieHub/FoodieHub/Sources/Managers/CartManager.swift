//
//  CartManager.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 19.05.2023.
//

import Foundation

class CartManager {
    var items = [Product]()

    static let shared = CartManager()
    
    var cartItems: [CartItem] = []
    
    func addToCart(product: Product) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.product.name == product.name }) {
            // Продукт уже есть в корзине, увеличиваем количество
            var existingItem = cartItems[existingItemIndex]
            existingItem.quantity += 1
            cartItems[existingItemIndex] = existingItem
        } else {
            // Продукта еще нет в корзине, добавляем новый элемент
            let cartItem = CartItem(product: product, quantity: 1)
            cartItems.append(cartItem)
        }
    }

    func removeFromCart(product: Product) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.product.name == product.name }) {
            let existingItem = cartItems[existingItemIndex]
            if existingItem.quantity > 1 {
                // Уменьшаем количество
                cartItems[existingItemIndex].quantity -= 1
            } else {
                // Удаляем элемент из корзины
                cartItems.remove(at: existingItemIndex)
            }
        }
    }
}

