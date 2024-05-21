//
//  PingTestView.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 20.05.2024.
//

import UIKit

class PingTestView: UIView {
    
    @IBOutlet var colorBacgkgroundView: UIView!
    @IBOutlet var pingLabel: UILabel!
    @IBOutlet var squarePingView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed( "PingTestView", owner: self, options: nil)
        addSubview(colorBacgkgroundView)
        colorBacgkgroundView.frame = self.bounds
        colorBacgkgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setupUIView(ping:Int, isLightBlueBackground:Bool ) {
        pingLabel.text = "\(ping) ms"
        if isLightBlueBackground {
            colorBacgkgroundView.backgroundColor = UIColor(hexString: "#092351")
        } else {
            colorBacgkgroundView.backgroundColor = UIColor(hexString: "#0B2148")
        }
        DispatchQueue .main.asyncAfter(deadline: .now() +  0.5 ) {
            self.animateSquarePingViewPosition(ping: ping)
        }
    }
    
    func animateSquarePingViewPosition(ping: Int) {
        let safeAreaBottom = safeAreaLayoutGuide.layoutFrame.maxY
        let finalPositionY = safeAreaBottom - self.squarePingView.frame.height
        let initialPositionY = squarePingView.frame.origin.y
        let duration = Double(ping) / 1000.0
        
        self.squarePingView.frame.origin.y = initialPositionY
        
        UIView.animate(withDuration: duration, animations: {
            self.squarePingView.frame.origin.y = finalPositionY
            self.layoutIfNeeded()
        }) { _ in
            self.squarePingView.isHidden = true
            self.squarePingView.frame.origin.y = initialPositionY
            self.squarePingView.isHidden = false
            self.animateSquarePingViewPosition(ping: ping)
        }
    }
}
