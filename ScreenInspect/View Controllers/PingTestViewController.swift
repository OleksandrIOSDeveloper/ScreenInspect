//
//  PingTestViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 21.05.2024.
//

import UIKit

class PingTestViewController: UIViewController {

    
    
    @IBOutlet var ping3000View: PingTestView!
    @IBOutlet var ping2000View: PingTestView!
    @IBOutlet var ping1000View: PingTestView!
    @IBOutlet var ping500View: PingTestView!
    @IBOutlet var ping250View: PingTestView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#092351")
        ping3000View.setupUIView(ping: 3000, isLightBlueBackground: true)
        ping2000View.setupUIView(ping: 2000, isLightBlueBackground: false)
        ping1000View.setupUIView(ping: 1000, isLightBlueBackground: true)
        ping500View.setupUIView(ping: 500, isLightBlueBackground: false)
        ping250View.setupUIView(ping: 250, isLightBlueBackground: true)
        
    }
    

    @IBAction func gotItButton(_ sender: Any) {
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
