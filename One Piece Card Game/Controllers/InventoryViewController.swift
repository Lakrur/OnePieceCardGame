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
    
    var purchasedCharachters: [CharachterModel] = []
    var purchasedFlags: [FlagModel] = []
    var purchasedBackrounds: [BackgroundModel] = []
    var musicManager = MusicManager.shared
   
    
    // MARK: viewDidLoad
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
    
    // MARK: viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        musicManager.resumeMusic()
        
        
        // loading flags and backgrounds from the database
        let realm = try! Realm()
        let purchasedBackgrounds = realm.objects(BackgroundModel.self).filter("isPurchased == true")

        var fetchedBackground: [BackgroundModel] = [BackgroundModel(picture: "background0", isPurchased: true, id: 1)]
        
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
        
        let purchasedFlags = realm.objects(FlagModel.self).filter("isPurchased == true")
        
        var fetchedFlag: [FlagModel] = [FlagModel(picture: "flag", flagDescription: "The Straw Hat Pirates' Jolly Roger is an image of a traditional skull and crossbones, topped with a straw hat given by Luffy Shanks. Also, this Jolly Roger can be seen on the sails of the Going Merry and the Thousand Sunny. It seems that Luffy's image of the Jolly Roger for his pirate crew was conceived long before he could realize it. Even at the very beginning of the journey, when Luffy had just recruited the first nakama, Roronoa Zoro, into his team, he imagined how he would look on his own pirate ship, on which he presented his Jolly Roger, which in the end turned out to be so. The realization of the image took place at the beginning of his journey with Usopp, Nami, and Zoro. He presented his version of the pirate flag to everyone, but the nakama criticized him. Usopp then stated that he was a great artist and they should have contacted him immediately, after which he drew a version of Luffy in good condition. After the Straw Hats' meeting with Laboon, Luffy promised him that he would return to see him under the pretext of a rematch. As a sign of his promised rematch, Luffy drew a Jolly Roger on Laboon's wounds, noting that he would only wash him away after he had bypassed the Grand Line and they would meet again.", isPurchased: true, id: 1)]
        
        availableFlags.removeAll()
        
        for flag in fetchedFlag {
            if !flag.isInvalidated {
                availableFlags.append(flag)
            }
        }
        
        for flags in purchasedFlags {
            if !flags.isInvalidated && !availableFlags.contains(flags) {
                availableFlags.append(flags)
            }
        }
        
        
        collectionView.reloadData()
        
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
            cell.inventoryImageView.image = UIImage(named: purchasedCharachters[indexPath.row].picture)
           case 1:
            cell.inventoryImageView.image = UIImage(named: purchasedFlags[indexPath.row].picture)
        case 2:
            if let image = UIImage(named: purchasedBackrounds[indexPath.row].picture) {
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
                    inventoryEquipViewController.imageRecieve = UIImage(named: availableFlags[selectedIndexPath.row].picture)!
                    inventoryEquipViewController.labelRecive = availableFlags[selectedIndexPath.row].flagDescription
                case 2:
                    inventoryEquipViewController.backgroundImageReceive = UIImage(named: availableBackgrounds[selectedIndexPath.row].picture)!
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
