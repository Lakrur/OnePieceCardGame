//
//  DecorationShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 09.02.2023.
//

import UIKit

private let reuseIdentifier =  "DecorationShopCell"

class DecorationShopViewController: UIViewController {
    
    var cardFlags: [AllFlags] = []
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let selectedShopFlag = segmentedControl.selectedSegmentIndex
        switch selectedShopFlag {
        case 0:
            cardFlags = shopFlags
            print("FLag")
        default:
            break
        }
        collectionView.reloadData()
        cardFlags = shopFlags
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
            return cardFlags.count
            default:
                return 0
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecorationShopCell", for: indexPath) as! DecorationCell
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell.decorationImageView.image = cardFlags[indexPath.row].picture
        default:
            print("error")
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detailDecorShopController = segue.destination as! DecorDetailShopViewController
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                switch segmentedControl.selectedSegmentIndex {
                case 0:
                    detailDecorShopController.imageRecive = cardFlags[selectedIndexPath.row].picture
                    detailDecorShopController.labelRecive = cardFlags[selectedIndexPath.row].description
                    for flag in shopFlags {
                        detailDecorShopController.priceRecive = "\(flag.price)"
                        
                    }
                default:
                    print("error")
                }
            }
            
        }
    }
    
    @IBAction func decorationPicker(_ sender: Any) {
        let selectedShopFlag = segmentedControl.selectedSegmentIndex
        switch selectedShopFlag {
        case 0:
            cardFlags = shopFlags
            print("FLag")
        case 1:
            print("Back")
        default:
            break
        }
        collectionView.reloadData()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DecorationShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
}
