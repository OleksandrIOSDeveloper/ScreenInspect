//
//  ActionRowView.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 09.05.2024.
//

import UIKit

class ActionRowView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    var completion: () -> Void = {}
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed( "ActionRowView", owner: self, options: nil)
        addSubview(contentView)
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setupUI(imageName: String, title: String, subTitle: String) {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    @IBAction func tapButton(_ sender: Any) {
        completion()
    }
}

