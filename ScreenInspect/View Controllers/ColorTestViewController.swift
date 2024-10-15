//
//  ColorTestViewController.swift
//  ScreenInspect
//
//  Created by Oleksandr Roditieliev on 11.05.2024.
//

import UIKit

class ColorTestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var backLabel: UILabel!
    
    var arrayColorsHex = [ColorConstants.redColor, ColorConstants.greenColor, ColorConstants.blueColor, ColorConstants.yellowColor, ColorConstants.cyanColor, ColorConstants.magentaColor, ColorConstants.blackColor, ColorConstants.whiteColor, "gradient"]
    let reuseIdentifier = "colorCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backLabel.text = NSLocalizedString("Back", comment: "")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayColorsHex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.setupCell(with: arrayColorsHex[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailColorViewController") as? DetailColorViewController {
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.setupUI(with: arrayColorsHex[indexPath.row])
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}
