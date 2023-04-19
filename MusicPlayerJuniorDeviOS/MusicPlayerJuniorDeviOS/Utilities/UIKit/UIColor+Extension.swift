//
//  UIColor+Extension.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 31/03/2023.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    class var appYellow: UIColor {
        return UIColor.init(hexString: "f9a61a", alpha: 1)
    }
    
    func toUInt() -> UInt {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            
            var colorAsUInt: UInt32 = 0
            
            colorAsUInt += UInt32(red * 255.0) << 16 +
            UInt32(green * 255.0) << 8 +
            UInt32(blue * 255.0)
            
            return UInt(colorAsUInt)
        }
        
        return 0xF7A719
    }
}

extension UIColor {
    
    static func loadColor(withColor: String) -> UIColor? {
        return UIColor(named: withColor, in: Bundle(for: BaseCustomView.self), compatibleWith: nil)
    }
    
    static var mainTheme: UIColor {
        return loadColor(withColor: "MainTheme")!
    }
    
    static var primaryTheme: UIColor {
        return loadColor(withColor: "PrimaryTheme")!
    }
    
    static var controlButton: UIColor {
        return loadColor(withColor: "ControlButton")!
    }
    
    static var bgTwo: UIColor {
        return loadColor(withColor: "BgTwo")!
    }
    
    static var buttonBackground: UIColor {
        return loadColor(withColor: "ButtonBackground")!
    }
    
    static var textColor: UIColor {
        return loadColor(withColor: "TextColor")!
    }
    
    static var texColorOne: UIColor {
        return loadColor(withColor: "TextColor1")!
    }
    
    static var textColorForYellow: UIColor {
        return loadColor(withColor: "TextColorForYellow")!
    }
    
}
