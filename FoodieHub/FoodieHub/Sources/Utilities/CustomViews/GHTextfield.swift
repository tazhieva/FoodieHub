//
//  GHTextfield.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit
import SnapKit

class FHTextfield: UIView {
    
    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .black
        textField.tintColor = UIColor.black
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) // Отступ слева
        textField.leftViewMode = .always
        return textField
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(textField)
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
