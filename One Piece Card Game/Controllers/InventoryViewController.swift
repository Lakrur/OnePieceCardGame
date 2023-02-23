//
//  InventoryViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 28.01.2023.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "InventoryCell"

class InventoryViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var purchasedCharachters: [AllCharachter] = []
    var purchasedFlags: [Flag] = []
    var purchasedBackrounds: [BackgroundModel] = []
    var musicManager = MusicManager.shared
   
    
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
        case 2:
            purchasedBackrounds = availableBackgrounds
        default:
            break
            
        }
        collectionView.reloadData()

        purchasedFlags = availableFlags
        purchasedCharachters = availableCharachter
        purchasedBackrounds = availableBackgrounds
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        musicManager.resumeMusic()
        
        
        
        let realm = try! Realm()
        let purchasedBackgrounds = realm.objects(BackgroundModel.self).filter("isPurchased == true")

        var fetchedBackground: [BackgroundModel] = [BackgroundModel(picture: UIImage(named: "background0")!, isPurchased: true, id: 1)]
        
        availableBackgrounds.removeAll()
        
        for background in fetchedBackground {
            if !background.isInvalidated {
                availableBackgrounds.append(background)
            }
        }

        for background in purchasedBackgrounds {
            if !background.isInvalidated && !availableBackgrounds.contains(background) {
                availableBackgrounds.append(background)
                
            }
        }
        collectionView.reloadData()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
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
        case 2:
            return purchasedBackrounds.count
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
        case 2:
            if let image = UIImage(data: purchasedBackrounds[indexPath.row].picture) {
                       cell.inventoryImageView.image = image
                   }
           default:
               print("error")
           }
       
       return cell
   }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if segmentedControl.selectedSegmentIndex == 0 {
              return false
          } else {
              return true
          }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inventorySegue" {
            let inventoryEquipViewController = segue.destination as! InventoryEquipViewController
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                switch segmentedControl.selectedSegmentIndex {
                case 0:
                    break
                case 1:
                    inventoryEquipViewController.imageRecieve = availableFlags[selectedIndexPath.row].picture
                    inventoryEquipViewController.labelRecive = availableFlags[selectedIndexPath.row].description
                case 2:
                    inventoryEquipViewController.backgroundImageReceive = UIImage(data: availableBackgrounds[selectedIndexPath.row].picture)!
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
            purchasedBackrounds = availableBackgrounds
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
