//
//  ShopCollectionViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 30.01.2023.
//

import UIKit

private let reuseIdentifier = "ShopCell"

class ShopCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var commonCharachterShop: [ShopCharachter] = []
    var uncommonCharahterShop: [ShopCharachter] = []
    var rareCharachterShop: [ShopCharachter] = []
    var epicCharachterShop: [ShopCharachter] = []
    var legendaryCharachterShop: [ShopCharachter] = []
    
    struct ShopCharachter {
        
        var id: Int
        var picture: String
        var rarity: rarety
        var price: Int
    }
    
    enum rarety {
        case common
        case uncommon
        case rare
        case epic
        case legendary
    }
    
    var allCharachtersShop: [ShopCharachter] =
    [ShopCharachter(id: 10, picture: "chopper", rarity: .uncommon, price: 200)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for charachter in allCharachtersShop {
            switch charachter.rarity {
            case .common:
                commonCharachterShop.append(charachter)
            case .uncommon:
                uncommonCharahterShop.append(charachter)
            case .rare:
                rareCharachterShop.append(charachter)
            case .epic:
                epicCharachterShop.append(charachter)
            case .legendary:
                legendaryCharachterShop.append(charachter)
            }
        }
        let selectedRarityIndex = segmentedControl.selectedSegmentIndex
        switch selectedRarityIndex {
        case 0:
            allCharachtersShop = commonCharachterShop
        case 1:
            allCharachtersShop = uncommonCharahterShop
        case 2:
            allCharachtersShop = rareCharachterShop
        case 3:
            allCharachtersShop = epicCharachterShop
        case 4:
            allCharachtersShop = legendaryCharachterShop
        default:
            break
        }
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCharachtersShop.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShopCell
        
        cell.charachtersShopImageView.image = UIImage(named: allCharachtersShop[indexPath.row].picture)
        
        return cell
    }
    
    
    
    @IBAction func selectRarityCharachter(_ sender: UISegmentedControl) {
        let selectedRarityIndex = segmentedControl.selectedSegmentIndex
        switch selectedRarityIndex {
        case 0:
            allCharachtersShop = commonCharachterShop
        case 1:
            allCharachtersShop = uncommonCharahterShop
        case 2:
            allCharachtersShop = rareCharachterShop
        case 3:
            allCharachtersShop = epicCharachterShop
        case 4:
            allCharachtersShop = legendaryCharachterShop
        default:
            break
        }
        collectionView.reloadData()
    }
        
        
        
        @IBAction func goBack(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    }
