//
//  UITableView+Extension.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 28/03/2023.
//

import Foundation
import UIKit

extension UITableView {
    func register(_ strIDs: String ...) {
        strIDs.forEach {
            self.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
}
