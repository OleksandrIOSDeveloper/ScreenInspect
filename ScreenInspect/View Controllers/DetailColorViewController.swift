//
//  DetailColorViewController.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 16.05.2024.
//

import UIKit

class DetailColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI(with colorHex: String) {
        if colorHex == "gradient" {
            view.applyGradient(isVertical: true, colorArray: [UIColor(hexString:
                                                                        ColorConstants.gradientPinkColor),
                                                              UIColor(hexString: ColorConstants.gradientDarkBlueColor),
                                                              UIColor(hexString: ColorConstants.gradientLightBlueColor),
                                                              UIColor(hexString: ColorConstants.gradientGreenColor),
                                                              UIColor(hexString: ColorConstants.gradientYellowColor),
                                                              UIColor(hexString: ColorConstants.gradientRedColor)], cornerRadius: 0)
        } else {
            view.backgroundColor = UIColor(hexString: colorHex)
        }
    }
    
    @IBAction func gotItButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}
