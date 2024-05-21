//
//  ExtensionUIView.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 21.05.2024.
//

import Foundation
import UIKit

extension UIView {

    func applyGradient(isVertical: Bool, colorArray: [UIColor], cornerRadius: CGFloat) {
        // Remove existing gradient layers
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })

        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            // Top to bottom
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        } else {
            // Left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }

        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
