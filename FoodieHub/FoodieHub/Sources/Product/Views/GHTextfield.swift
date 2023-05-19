//
//  GHTextfield.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import UIKit
import SnapKit

class GHTextfield: UITextField {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .black
        textField.tintColor = UIColor.black
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
}


extension GHTextfield {
    private func configUI() {
        addSubview(textField)
        addSubview(dividerView)
    }
    
    private func makeConstraints() {
        textField.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(5)
            make.height.equalTo(0.3)
            make.width.equalTo(textField.snp.width)
        }
    }
}
