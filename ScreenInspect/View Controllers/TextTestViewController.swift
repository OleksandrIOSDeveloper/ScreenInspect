//
//  TextTestViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 09.05.2024.
//

import UIKit

class TextTestViewController: UIViewController {
    
    @IBOutlet var mainContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a UIScrollView for scrolling the content
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        scrollView.autoresizingMask = [.flexibleWidth]
        mainContentView.addSubview(scrollView)
        // Add content to the UIScrollView
        var yOffset: CGFloat = 0
        let screenWidth = view.bounds.width // Width of the screen
        
        for dpi in 10...150 {
            let label = UILabel()
            label.numberOfLines = 0 // Allow text wrapping
            let repeatedText = "\(dpi) dpi " // Base text
            var fullText = "" // Final text to display
            var textWidth: CGFloat = 0 // Width of the text
            
            // Loop to add repeatedText until the text width reaches the screen width
            while textWidth < screenWidth + 100 { // Add 100 points to extend beyond the screen width
                fullText += repeatedText
                let size = (fullText as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(dpi))])
                textWidth = size.width
            }
            // Set label properties
            label.text = fullText
            label.font = UIFont.systemFont(ofSize: CGFloat(dpi))
            label.textColor = UIColor.white // Set text color to white
            label.sizeToFit() // Adjust label size to fit content
            // Set label width to screen width plus 100 points
            label.frame = CGRect(x: 0, y: yOffset, width: screenWidth + 100, height: label.frame.height)
            yOffset += label.frame.height // Update yOffset for next label
            scrollView.addSubview(label)
        }
        // Update the content size of the UIScrollView
        scrollView.contentSize = CGSize(width: screenWidth, height: yOffset)
        
    }
    
    @IBAction func gotItButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}


    

