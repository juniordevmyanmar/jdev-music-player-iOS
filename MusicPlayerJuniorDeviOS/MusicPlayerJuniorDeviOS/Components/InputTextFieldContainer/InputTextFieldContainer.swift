//
//  InputTextFieldContainer.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 26/03/2023.
//

import Foundation
import UIKit

class InputTextFieldContainer: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
