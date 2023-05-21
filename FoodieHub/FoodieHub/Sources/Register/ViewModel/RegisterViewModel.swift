//
//  RegisterViewModel.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 21.05.2023.
//

import Foundation

class RegisterViewModel {
    var username: String = ""
    var phoneNumber: String = ""
    var address: String = ""
    var pickedDay: String = ""
    var pickedPeriod: String = ""
    
    func saveUserInfo() {
        guard !username.isEmpty, !phoneNumber.isEmpty, !address.isEmpty, !pickedDay.isEmpty, !pickedPeriod.isEmpty else {
            return
        }
        
        let userObject = User(username: username, phoneNumber: phoneNumber, address: address, deliveryDay: pickedDay, deliveryPeriod: pickedPeriod)
        UserSettings.username = username
        UserSettings.phoneNumber = phoneNumber
        UserSettings.address = address
        UserSettings.pickedDay = pickedDay
        UserSettings.pickedPeriod = pickedPeriod
    }
}

