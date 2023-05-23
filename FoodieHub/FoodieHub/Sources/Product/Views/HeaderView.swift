//
//  HeaderView.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 23.05.2023.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    
    var title: String  {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        self.title = titleLabel.text ?? ""
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
