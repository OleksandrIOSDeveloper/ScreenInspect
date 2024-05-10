//
//  CustomGotItButton.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 10.05.2024.
//

import Foundation

import UIKit

class CustomGotItButton: UIButton {

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupButton()
//        
//    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
       // fatalError("init(coder:) has not been implemented")
        
    }

    private func setupButton() {
        backgroundColor = .red
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        setTitleColor(.white, for: .normal)
        setTitle("Got it", for: .normal)
        frame = CGRect(x: 0, y: 0, width: 120, height: 40)
    }
}
