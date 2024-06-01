//
//  IntroViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 09.05.2024.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet var introTextField: UITextView!
    @IBOutlet var backLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backLabel.text = NSLocalizedString("Back", comment: "")
        localizeText()
    }
    
    func localizeText() {
        let localizedText = NSLocalizedString("intro_text", comment: "")
        introTextField.text = localizedText
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
