//
//  UIViewController+Extension.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import UIKit

public extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}
