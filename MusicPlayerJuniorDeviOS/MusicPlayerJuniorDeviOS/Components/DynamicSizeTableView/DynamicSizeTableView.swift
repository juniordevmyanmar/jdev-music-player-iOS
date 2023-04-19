//
//  DynamicSizeTableView.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 31/03/2023.
//

import Foundation
import UIKit

class DynamicSizeTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
            self.layoutIfNeeded()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
}
