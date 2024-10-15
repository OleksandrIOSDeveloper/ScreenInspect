//
//  MyCollectionViewCell.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 11.05.2024.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    func setupCell(with colorHex: String) {
        if colorHex == "gradient" {
            colorView.applyGradient(isVertical: true, colorArray: [UIColor(hexString:
                                                                            ColorConstants.gradientPinkColor),
                                                                   UIColor(hexString: ColorConstants.gradientDarkBlueColor),
                                                                   UIColor(hexString: ColorConstants.gradientLightBlueColor),
                                                                   UIColor(hexString: ColorConstants.gradientGreenColor),
                                                                   UIColor(hexString: ColorConstants.gradientYellowColor),
                                                                   UIColor(hexString: ColorConstants.gradientRedColor)],
                                    cornerRadius: 6)
        } else {
            colorView.layer.cornerRadius = 6
            colorView.backgroundColor = UIColor(hexString: colorHex)
        }
    }
    
}
