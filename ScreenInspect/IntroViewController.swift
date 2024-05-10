//
//  IntroViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 09.05.2024.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var introTextField: UITextView!
    
    let listText = """
    Our app is the simplest way to check if you have any dead pixels on your screen. Our dead pixel test app is an easy and convenient way for you to check if your screen has dead pixels. Our test will display various colors and patterns on your screen, allowing you to identify any dead pixels that may be present.
    
    How to use:
    
    1. Make sure your screen is as clean as can be. If it is not, you might mistake dust or dirt for a dead pixel. To prepare your screen to be tested for dead pixels, grab a piece of soft cloth, preferably a high-density one. Then, gently and carefully rub every inch of your screen and make sure it is crystal clear.
    
    2. Click on the test-button to start testing your screen for dead pixels.
    
    3. Click on the "Got it" button then you end up testing your display.
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introTextField.text = listText
       
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
