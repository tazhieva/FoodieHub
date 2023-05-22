//
//  DatePicker.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit

class DeliverySelectionView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let daysOfWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    private let deliveryPeriods = ["09:00-11:00", "11:00-13:00", "13:00-15:00", "15:00-17:00", "17:00-19:00", "19:00-22:00"]
    
    private let deliveryPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    var selectedDayOfWeek: String? = "Понедельник"
    var selectedDeliveryPeriod: String? = "09:00-11:00"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        deliveryPicker.delegate = self
        deliveryPicker.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(deliveryPicker)
        
        deliveryPicker.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return daysOfWeek.count
        } else {
            return deliveryPeriods.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textAlignment = .center
        
        if component == 0 {
            label.text = daysOfWeek[row]
        } else {
            label.text = deliveryPeriods[row]
        }
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedDayOfWeek = daysOfWeek[row]
        } else {
            selectedDeliveryPeriod = deliveryPeriods[row]
        }
    }
}
