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
    /// Reloads a table view without losing track of what was selected.
    func reloadDataSavingSelections() {
        let selectedRows = indexPathsForSelectedRows
        reloadData()
        if let selectedRow = selectedRows {
            for indexPath in selectedRow {
                selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
    }
}
