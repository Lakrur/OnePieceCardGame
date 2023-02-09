//
//  InventoryViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 28.01.2023.
//

import UIKit

private let reuseIdentifier = "InventoryCell"

class InventoryViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var purchasedCharachters: [AllCharachter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedInventoryCell = segmentedControl.selectedSegmentIndex
        switch selectedInventoryCell {
        case 0:
            purchasedCharachters = availableCharachter
            print("Charachters")
        case 1:
            print("Flags")
        case 2:
            print("Backgrounds")
        default:
            break
            
        }
        collectionView.reloadData()

        purchasedCharachters = availableCharachter
        for charachter in purchasedCharachters {
            if charachter.isPurchased == true {
                purchasedCharachters.append(charachter)
            }
        }
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return purchasedCharachters.count
   }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCell", for: indexPath) as! InventoryCell
       
        cell.inventoryImageView.image = purchasedCharachters[indexPath.row].picture
       
       return cell
   }
    
    
    @IBAction func inventoryPicker(_ sender: Any) {
        let selectedInventoryCell = segmentedControl.selectedSegmentIndex
        switch selectedInventoryCell {
        case 0:
            purchasedCharachters = availableCharachter
            print("Charachters")
        case 1:
            print("Flags")
        case 2:
            print("Backgrounds")
        default:
            break
        }
        collectionView.reloadData()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
