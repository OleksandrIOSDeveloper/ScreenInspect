//
//  ColorTestViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 11.05.2024.
//

import UIKit

class ColorTestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var arrayColorsHex = ["#FF0000", "#00FF01", "#0000FE", "#FFFF01", "#01FFFF", "#FF00FE", "#010101", "#FFFFFF", "gradient"]
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        print("You selected cell #\(arrayColorsHex[indexPath.row])")
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
    
}
