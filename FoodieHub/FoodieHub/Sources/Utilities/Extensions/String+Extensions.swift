//
//  String+Extensions.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 23.05.2023.
//

import Foundation

extension String {
    var textWithoutPhoneMask: String {
        if self.count == 0 {
            return self
        }
        
        var result = self
        
        result = result.replacingOccurrences(of: "+", with: "")
        result = result.replacingOccurrences(of: " ", with: "")
        result = result.replacingOccurrences(of: "(", with: "")
        result = result.replacingOccurrences(of: ")", with: "")
        result = result.replacingOccurrences(of: "-", with: "")
        
        return result
    }
}
