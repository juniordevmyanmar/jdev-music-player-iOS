//
//  SectionProtocol.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 28/03/2023.
//

import Foundation

protocol SectionItem {
    func toType<T: SectionItem>(_ type: T.Type) -> T?
}

extension SectionItem {
    func toType<T: SectionItem>(_ type: T.Type) -> T? {
        self as? T
    }
}

final class LoginSections {
    var items: [SectionItem]
    
    init(items: [SectionItem]) {
        self.items = items
    }
}


