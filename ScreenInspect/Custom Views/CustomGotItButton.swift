//
//  CustomGotItButton.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 10.05.2024.
//

import Foundation

import UIKit

class CustomGotItButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 228.0/255.0, alpha: 1.0)
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        setTitleColor(.white, for: .normal)
        setTitle(NSLocalizedString("Got it", comment: ""), for: .normal)
        setTitleColor(.white, for: .highlighted)
    }
}

