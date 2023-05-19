//
//  Product.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import Foundation

struct Product {
    let name: String
    let price: Double
    let image: String
    let description: String
    let category: String
    let amount: Int? = 0
    let availability: Bool
    
}

struct MockData {
    
    static let products: [Product] = [
        // Продукты из категории "Фрукты"
        Product(name: "Авокадо Хасс Колумбия шт", price: 1190, image: "https://arbuz.kz/image/s3/arbuz-kz-products/237984-avokado_hass_kolumbiya_sht_.jpg?w=360&h=360&_c=1684403230", description: "Знаменитые авокадо сорта «Хасс» с пупырчатой темной кожурой и невероятно вкусной мякотью! Во всем мире эти авокадо ценятся за свой чуть ореховый вкус и отличную «стойкость» при транспортировке. Мякоть авокадо Хасс» — мягкая, нежная, сливочная. Этот сорт считается идеальным для гуакамоле.", category: "Фрукты", availability: true),
        Product(name: "Бананы кг", price: 990, image: "https://arbuz.kz/image/s3/arbuz-kz-products/19445-banany_kg.jpg?w=360&h=360&_c=1684476754", description: "Бананы десертные обладают плотной, сладкой мякотью и освежающим ароматом с травянистыми нотками. Цвет бананов может варьироваться от салатного до желтого цвета.", category: "", availability: true),
        Product(name: "Яблоко Гренни Смит Франция кг", price: 1260, image: "", description: "В этом фрукте содержится большое количество клетчатки, которая благоприятно сказывается на деятельности кишечника и помогает улучшить работу ЖКТ. В яблоках Гренни Смит фолиевая кислота и витамин А. Стоит также сказать о том, что в состав фрукта входит большое количество калия, который благоприятно сказывается на деятельности сердечнососудистой системы.", category: "Фрукты", availability: true)
//        Product(name: "", price: Double, image: "https://arbuz.kz/image/s3/arbuz-kz-products/242599-yabloko_grenni_smit_franciya_kg.jpg?w=360&h=360&_c=1683541312", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//        Product(name: "", price: Double, image: "", description: "", category: "", availability: true),
//
//

    ]

}
