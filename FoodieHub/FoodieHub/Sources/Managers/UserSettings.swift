//
//  UserSettings.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 20.05.2023.
//

import UIKit

class UserSettings {
    private enum SettingsKey: String {
        case username
        case phoneNumber
        case address
        case pickedDay
        case pickedPeriod
    }
    
    static var username: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKey.username.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.username.rawValue
            if let name = newValue {
                print("Value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var phoneNumber: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKey.phoneNumber.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.phoneNumber.rawValue
            if let phoneNumber = newValue {
                print("Value: \(phoneNumber) was added to key \(key)")
                defaults.set(phoneNumber, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var address: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKey.address.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.address.rawValue
            if let address = newValue {
                print("Value: \(address) was added to key \(key)")
                defaults.set(address, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var pickedDay: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKey.pickedDay.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.pickedDay.rawValue
            if let day = newValue {
                print("Value: \(day) was added to key \(key)")
                defaults.set(day, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var pickedPeriod: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKey.pickedPeriod.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.pickedPeriod.rawValue
            if let period = newValue {
                print("Value: \(period) was added to key \(key)")
                defaults.set(period, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
