//
//  UIFont+Extension.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 31/03/2023.
//

import Foundation
import UIKit

extension UIFont {
    class func raleWay700(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Raleway-700", size: ofSize) else {
            return UIFont.systemFont(ofSize: ofSize)
        }
        return font
    }
}
