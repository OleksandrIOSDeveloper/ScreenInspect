//
//  MenuViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 08.05.2024.
//

import UIKit
import DeviceKit

class MenuViewController: UIViewController {
    
    @IBOutlet var msTestView: ActionRowView!
    @IBOutlet var textTestView: ActionRowView!
    @IBOutlet var colorTestView: ActionRowView!
    @IBOutlet var introductionView: ActionRowView!
    
    @IBOutlet var deviceLabel: UILabel!
    @IBOutlet var versionIOSLabel: UILabel!
    @IBOutlet var screenSizeLabel: UILabel!
    @IBOutlet var resolutionPixelLabel: UILabel!
    @IBOutlet var brightnessLabel: UILabel!
    @IBOutlet var aspectRatioLabel: UILabel!
    @IBOutlet var screenDestinyLabel: UILabel!
    @IBOutlet var batteryLevelLabel: UILabel!
   
    @IBOutlet var topStackViewConstraint: NSLayoutConstraint!
    
    var updateTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        msTestView.setupUI(imageName: "msTest", title: "MS Test", subTitle: "Testing the display response.")
        textTestView.setupUI(imageName: "textTest", title: "Text test", subTitle: "Testing the display of text on the display")
        colorTestView.setupUI(imageName: "colorTest", title: "Color test", subTitle: "Testing the display of colors on the display")
        introductionView.setupUI(imageName: "introduction", title: "Introduction", subTitle: "Information about the application")
        deviceLabel.text = String(describing: UIDevice.modelName)
        versionIOSLabel.text = UIDevice.current.systemVersion
        screenSizeLabel.text = "\(String(describing: Device.current.diagonal)) inches"
        resolutionPixelLabel.text = "\(Int(UIScreen.main.nativeBounds.size.width))x\(Int(UIScreen.main.nativeBounds.size.height)) px"
        aspectRatioLabel.text = String(describing: Device.current.screenRatio)
        guard let ppi = Device.current.ppi else {
            screenDestinyLabel.text = "Unknown ppi"
            return
        }
        screenDestinyLabel.text = "\(ppi) ppi"
        
        msTestView.completion = {
            self.performSegue(withIdentifier: "PingTestViewController", sender: self)
        }
        textTestView.completion = {
            self.performSegue(withIdentifier: "TextTestViewController", sender: self)
        }
        colorTestView.completion = {
            self.performSegue(withIdentifier: "ColorTestViewController", sender: self)
        }
        introductionView.completion = {
            self.performSegue(withIdentifier: "IntroViewController", sender: self)
        }
    }
    
    @objc func updateLabels() {
        guard let levelBattery = Device.current.batteryLevel else {
            batteryLevelLabel.text = "---"
            return
        }
          batteryLevelLabel.text = "\(String(describing:levelBattery))%"
          brightnessLabel.text = "\(String(describing: Device.current.screenBrightness))%"
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
        updateLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight < 700 {
            topStackViewConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         updateTimer?.invalidate()
     }
}

    


