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
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var rightSideAnchor: NSLayoutConstraint!
    
    
    var commonCharachterShop: [AllCharachter] = []
    var uncommonCharahterShop: [AllCharachter] = []
    var rareCharachterShop: [AllCharachter] = []
    var epicCharachterShop: [AllCharachter] = []
    var legendaryCharachterShop: [AllCharachter] = []
    
    
    var allCharachtersShop: [AllCharachter] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allCharachtersShop = shopCharachters
        
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        infoView.addGestureRecognizer(tapGesture )
    }
    
    @objc func tapGestureAction() {
        rightSideAnchor.constant = -300
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCharachtersShop.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShopCell
        
        cell.charachtersShopImageView.image = allCharachtersShop[indexPath.row].picture
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailShopController = segue.destination as! DetailShopViewController
        for charachter in allCharachtersShop {
            detailShopController.imageReceived = charachter.picture
            detailShopController.information = " is the \(charachter.rarity) charachter. Its price is \(charachter.price) belly. When you find two identical pictures the charachter will bring \(2) belly."
            detailShopController.buttonText = "\(charachter.price)"
        }
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
    
    
    
    @IBAction func infoButton(_ sender: UIButton) {
    
        rightSideAnchor.constant = 8
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        }
    
        
        @IBAction func goBack(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    }


