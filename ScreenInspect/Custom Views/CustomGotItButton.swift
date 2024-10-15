//
//  CustomGotItButton.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 10.05.2024.
//

import Foundation

import UIKit

class CustomGotItButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = UIColor(hexString: ColorConstants.buttonBlueColor)
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        setTitleColor(.white, for: .normal)
        setTitle(NSLocalizedString("Got it", comment: ""), for: .normal)
        setTitleColor(.white, for: .highlighted)
    }
}

