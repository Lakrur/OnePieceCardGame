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
        cardFlags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DecorationShopCell", for: indexPath) as! DecorationCell
        
        cell.decorationImageView.image = cardFlags[indexPath.row].picture
        
        return cell
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
