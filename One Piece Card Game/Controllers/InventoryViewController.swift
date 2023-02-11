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
    var purchasedFlags: [AllFlags] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let selectedInventoryCell = segmentedControl.selectedSegmentIndex
        switch selectedInventoryCell {
        case 0:
            purchasedCharachters = availableCharachter
            print("Charachters")
        case 1:
            purchasedFlags = availableFlags
        default:
            break
            
        }
        collectionView.reloadData()

        purchasedFlags = availableFlags
        purchasedCharachters = availableCharachter
       
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                return purchasedCharachters.count
            case 1:
                return purchasedFlags.count
            default:
                return 0
            }
   }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InventoryCell", for: indexPath) as! InventoryCell
        
        switch segmentedControl.selectedSegmentIndex {
           case 0:
               cell.inventoryImageView.image = purchasedCharachters[indexPath.row].picture
           case 1:
            cell.inventoryImageView.image = purchasedFlags[indexPath.row].picture
           default:
               print("error")
           }
       
       return cell
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inventorySegue" {
            let inventoryEquipViewController = segue.destination as! InventoryEquipViewController
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                switch segmentedControl.selectedSegmentIndex {
                case 0:
                    print("charachters")
                case 1:
                    inventoryEquipViewController.imageRecieve = availableFlags[selectedIndexPath.row].picture
                    inventoryEquipViewController.labelRecive = availableFlags[selectedIndexPath.row].description
                default:
                    print("error")
                }
            }
            
        }
    }
    
    
    @IBAction func inventoryPicker(_ sender: Any) {
        let selectedInventoryCell = segmentedControl.selectedSegmentIndex
        switch selectedInventoryCell {
        case 0:
            purchasedCharachters = availableCharachter
            print("Charachters")
        case 1:
            purchasedFlags = availableFlags
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

extension InventoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
}
