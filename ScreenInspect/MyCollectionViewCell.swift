//
//  MyCollectionViewCell.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 11.05.2024.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    func setupCell(with colorHex: String) {
        if colorHex == "gradient" {
            colorView.applyGradient(isVertical: true, colorArray: [UIColor(hexString: "#FE01B2"),
                                                                   UIColor(hexString: "#020693"),
                                                                   UIColor(hexString: "#00D4FD"),
                                                                   UIColor(hexString: "#22BC26"),
                                                                   UIColor(hexString: "#F5FE03"),
                                                                   UIColor(hexString: "#FD0102")])
        } else {
            colorView.backgroundColor = UIColor(hexString: colorHex)
        }
    }
}
