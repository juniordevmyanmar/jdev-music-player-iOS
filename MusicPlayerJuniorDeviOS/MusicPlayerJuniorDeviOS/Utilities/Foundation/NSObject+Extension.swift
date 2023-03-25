//
//  NSObject+Extension.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation

public extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
