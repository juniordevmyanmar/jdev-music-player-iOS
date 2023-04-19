//
//  AuthSegment.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 31/03/2023.
//

import Foundation
import UIKit

class CustomSegmentedControl: UISegmentedControl {
    private let segmentInset: CGFloat = 10
    private let segmentImage: UIImage? = UIImage(color: .textColor)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.bgTwo
        ], for: .normal)
        
        setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.controlButton
        ], for: .selected)
        
        // background
        backgroundColor = .primaryTheme
        layer.cornerRadius = 4
        // foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex),
           let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
            
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset,
                                                                            dy: segmentInset)
            foregroundImageView.image = segmentImage
            // substitute with our own colored image
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            // this removes the weird scaling animation!
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = 10
        }
    }
}

extension UIImage {
    // creates a UIImage given a UIColor
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
