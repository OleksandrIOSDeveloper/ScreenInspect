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
    
    @IBOutlet var phoneInformationConstantLabel: UILabel!
    @IBOutlet var deviceConstantLabel: UILabel!
    @IBOutlet var versionIOSConstantLabel: UILabel!
    @IBOutlet var batteryLevelConstantLabel: UILabel!
    @IBOutlet var resolutionConstantLabel: UILabel!
    @IBOutlet var screenSizeConsatntLabel: UILabel!
    @IBOutlet var brightnessConstantLabel: UILabel!
    @IBOutlet var aspectRatioConstantLabel: UILabel!
    @IBOutlet var screenDestinyConstantLabel: UILabel!
    
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
        if let languageCode = UserDefaults.standard.string(forKey: "selectedLanguage") {
            Bundle.setLanguage(languageCode)
        }
        setupUI()
    }
    
    func setupUI() {
        phoneInformationConstantLabel.text = NSLocalizedString("Phone information", comment: "")
        deviceConstantLabel.text = NSLocalizedString("Device", comment: "")
        versionIOSConstantLabel.text = NSLocalizedString("IOS version", comment: "")
        batteryLevelConstantLabel.text = NSLocalizedString("Battery level", comment: "")
        screenSizeConsatntLabel.text = NSLocalizedString("Screen size", comment: "")
        resolutionConstantLabel.text = NSLocalizedString("Resolution (pixel)", comment: "")
        brightnessConstantLabel.text = NSLocalizedString("Brightness", comment: "")
        aspectRatioConstantLabel.text = NSLocalizedString("Aspect ratio", comment: "")
        screenDestinyConstantLabel.text = NSLocalizedString("Screen destiny", comment: "")
        
        deviceLabel.text = String(describing: UIDevice.modelName)
        versionIOSLabel.text = UIDevice.current.systemVersion
        let screenSize = String(format: NSLocalizedString("screen_size_format", comment: ""), String(describing: Device.current.diagonal))
        screenSizeLabel.text = screenSize
        let screenWidth = Int(UIScreen.main.nativeBounds.size.width)
        let screenHeight = Int(UIScreen.main.nativeBounds.size.height)
        let resolution = String(format: NSLocalizedString("resolution_format", comment: ""), screenWidth, screenHeight)
        resolutionPixelLabel.text = resolution
        let screenRatio = Device.current.screenRatio
        let aspectRatio = String(format: NSLocalizedString("aspect_ratio_format", comment: ""), screenRatio.width, screenRatio.height)
        aspectRatioLabel.text = aspectRatio
        guard let ppi = Device.current.ppi else {
            screenDestinyLabel.text = NSLocalizedString("unknown_ppi", comment: "")
            return
        }
        screenDestinyLabel.text = String(format: NSLocalizedString("screen_density_format", comment: ""), ppi)
        
        msTestView.setupUI(imageName: "msTest", title: NSLocalizedString("MS Test", comment: ""), subTitle: NSLocalizedString("Testing the display response", comment: ""))
        textTestView.setupUI(imageName: "textTest", title: NSLocalizedString("Text test", comment: ""), subTitle: NSLocalizedString("Testing the display of text on the display", comment: ""))
        colorTestView.setupUI(imageName: "colorTest", title: NSLocalizedString("Color test", comment: ""), subTitle: NSLocalizedString("Testing the display of colors on the display", comment: ""))
        introductionView.setupUI(imageName: "introduction", title: NSLocalizedString("Introduction", comment: ""), subTitle: NSLocalizedString("Information about the application", comment: ""))
        
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
        batteryLevelLabel.text = "\(String(describing: levelBattery))%"
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
    
    @IBAction func changeLanguageButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: NSLocalizedString("Select Language", comment: ""),
                                      message: NSLocalizedString("Please choose your preferred language", comment: ""),
                                      preferredStyle: .alert)
        
        let englishAction = UIAlertAction(title: NSLocalizedString("English", comment: ""), style: .default) { _ in
            self.setLanguage(languageCode: "en")
        }
        
        let ukrainianAction = UIAlertAction(title: NSLocalizedString("Ukrainian", comment: ""), style: .default) { _ in
            self.setLanguage(languageCode: "uk")
        }
        
        alert.addAction(englishAction)
        alert.addAction(ukrainianAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setLanguage(languageCode: String) {
        // Зберігаємо обрану мову в UserDefaults
        UserDefaults.standard.set(languageCode, forKey: "selectedLanguage")
        UserDefaults.standard.synchronize()
        // Оновлюємо інтерфейс згідно обраної мови
        Bundle.setLanguage(languageCode)
        setupUI()
    }
    
}
