//
//  TextTestViewController.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 09.05.2024.
//

import UIKit

class TextTestViewController: UIViewController {
    
    @IBOutlet var mainContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        scrollView.autoresizingMask = [.flexibleWidth]
        mainContentView.addSubview(scrollView)
        var yOffset: CGFloat = 0
        let screenWidth = view.bounds.width
        
        for dpi in 10...150 {
            let label = UILabel()
            label.numberOfLines = 0
            let repeatedText = "\(dpi) dpi "
            var fullText = ""
            var textWidth: CGFloat = 0
            
            while textWidth < screenWidth + 100 {
                fullText += repeatedText
                let size = (fullText as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(dpi))])
                textWidth = size.width
            }
            
            label.text = fullText
            label.font = UIFont.systemFont(ofSize: CGFloat(dpi))
            label.textColor = UIColor.white
            label.sizeToFit()
            label.frame = CGRect(x: 0, y: yOffset, width: screenWidth + 100, height: label.frame.height)
            yOffset += label.frame.height
            scrollView.addSubview(label)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: yOffset)
    }
    
    @IBAction func gotItButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}


    

