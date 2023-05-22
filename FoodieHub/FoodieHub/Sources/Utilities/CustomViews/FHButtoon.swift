//
//  FHButtoon.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit

class FHButton: UIButton {
    
    init(title: String? = "") {
        super.init(frame: .zero)
        configureButton()
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12
        backgroundColor = UIColor(named: "mainColor")        
    }
}

//MARK: - Methods
extension FHButton {
    func setDisabled(_ disabled: Bool = true) {
        isUserInteractionEnabled = !disabled
        
        backgroundColor = disabled ? UIColor(named: "disabledColor") : UIColor(named: "mainColor")
    }
}
