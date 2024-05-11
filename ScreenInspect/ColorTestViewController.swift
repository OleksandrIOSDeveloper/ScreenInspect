//
//  ColorTestViewController.swift
//  ScreenInspect
//
//  Created by Александр Родителев on 11.05.2024.
//

import UIKit

class ColorTestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    let reuseIdentifier = "cell"
    var items = ["red", "green", "blue", "yellow", "light blue", "pink", "black", "white", "gradient"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.colorImageView.image = UIImage(named: self.items[indexPath.row])// The row value is the same as the index of the desired text within the array.
        //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)!")
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
    
}
