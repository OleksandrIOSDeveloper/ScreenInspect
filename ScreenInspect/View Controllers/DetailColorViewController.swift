//
//  DetailColorViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 16.05.2024.
//

import UIKit

class DetailColorViewController: UIViewController {
    
    var backgroundColorHex: String = "#FFFFFF"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI(with colorHex: String) {
        if colorHex == "gradient" {
            view.applyGradient(isVertical: true, colorArray: [UIColor(hexString: "#FE01B2"),
                                                              UIColor(hexString: "#020693"),
                                                              UIColor(hexString: "#00D4FD"),
                                                              UIColor(hexString: "#22BC26"),
                                                              UIColor(hexString: "#F5FE03"),
                                                              UIColor(hexString: "#FD0102")], cornerRadius: 0)
        } else {
            view.backgroundColor = UIColor(hexString: colorHex)
        }
    }
    
    @IBAction func gotItButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}
