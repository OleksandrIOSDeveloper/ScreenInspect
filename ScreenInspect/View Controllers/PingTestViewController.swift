//
//  PingTestViewController.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 21.05.2024.
//

import UIKit

class PingTestViewController: UIViewController {
    
    @IBOutlet var ping3000View: PingTestView!
    @IBOutlet var ping2000View: PingTestView!
    @IBOutlet var ping1000View: PingTestView!
    @IBOutlet var ping500View: PingTestView!
    @IBOutlet var ping250View: PingTestView!
    
    private let ping3000 = 3000
    private let ping2000 = 2000
    private let ping1000 = 1000
    private let ping500 = 500
    private let ping250 = 250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#092351")
        setupPingViews()
    }
    
    private func setupPingViews() {
        ping3000View.setupUIView(ping: ping3000, isLightBlueBackground: true)
        ping2000View.setupUIView(ping: ping2000, isLightBlueBackground: false)
        ping1000View.setupUIView(ping: ping1000, isLightBlueBackground: true)
        ping500View.setupUIView(ping: ping500, isLightBlueBackground: false)
        ping250View.setupUIView(ping: ping250, isLightBlueBackground: true)
    }
    
    @IBAction func gotItButton(_ sender: Any) {
        dismiss(animated: false)
    }
}
