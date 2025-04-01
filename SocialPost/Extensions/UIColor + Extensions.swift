//
//  UIColor + Extensions.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        
        let hexString = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        
        guard hexString.count == 6 else {
            self.init(white: 0.5, alpha: 1.0)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
