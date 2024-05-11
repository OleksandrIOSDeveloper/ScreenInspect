//
//  ViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 08.05.2024.
//

import UIKit
import DeviceKit

class ViewController: UIViewController {

 
    @IBOutlet var msTestView: ActionRowView!
    @IBOutlet var textTestView: ActionRowView!
    @IBOutlet var colorTestView: ActionRowView!
    @IBOutlet var introductionView: ActionRowView!
    
    @IBOutlet var deviceLabel: UILabel!
    @IBOutlet var versionIOSLabel: UILabel!
    @IBOutlet var screenSizeLabel: UILabel!
    @IBOutlet var resolutionPixelLabel: UILabel!
    @IBOutlet var refreshRateLabel: UILabel!
    @IBOutlet var aspectRatioLabel: UILabel!
    @IBOutlet var screenDestinyLabel: UILabel!
    
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
        refreshRateLabel.text = "\(String(describing: Device.current.screenBrightness))%"
        aspectRatioLabel.text = String(describing: Device.current.screenRatio)
        guard let ppi = Device.current.ppi else {
            screenDestinyLabel.text = "Unknown ppi"
            return
        }
        screenDestinyLabel.text = "\(ppi) ppi"
        
        msTestView.completion = {
            print("1111")
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
    }
    
    


