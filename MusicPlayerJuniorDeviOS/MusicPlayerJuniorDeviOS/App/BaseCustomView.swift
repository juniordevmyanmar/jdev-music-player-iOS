//
//  BaseCustomView.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 31/03/2023.
//

import Foundation
import UIKit

class BaseCustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        
    }
}
