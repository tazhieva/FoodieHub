//
//  SubscriptionPeriodView.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 21.05.2023.
//

import UIKit
import SnapKit

class SubscriptionPeriodView: UIView {
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: SubscriptionPeriod.oneMonth.title, at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: SubscriptionPeriod.threeMonths.title, at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: SubscriptionPeriod.sixMonths.title, at: 2, animated: false)
        segmentedControl.insertSegment(withTitle: SubscriptionPeriod.oneYear.title, at: 3, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    var selectedPeriod: SubscriptionPeriod? {
        get {
            let selectedIndex = segmentedControl.selectedSegmentIndex
            return SubscriptionPeriod(rawValue: selectedIndex) ?? .oneMonth
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

enum SubscriptionPeriod: Int {
    case oneMonth = 0
    case threeMonths
    case sixMonths
    case oneYear
    
    var title: String {
        switch self {
        case .oneMonth:
            return "1 месяц"
        case .threeMonths:
            return "3 месяца"
        case .sixMonths:
            return "6 месяцев"
        case .oneYear:
            return "1 год"
        }
    }
}
