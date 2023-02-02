//
//  DetailShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 01.02.2023.
//

import UIKit

class DetailShopViewController: UIViewController {
    
    
    @IBOutlet weak var passedImageView: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var butButton: UIButton!
    @IBOutlet weak var bringLabel: UILabel!
    @IBOutlet weak var coastLabel: UILabel!
    
    var imageReceived = UIImage()
    var information = String()
    var buttonText = String()
    var bringTextLabel = String()
    var coastTextLabel = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passedImageView.image = imageReceived
        informationLabel.text = "\(information)"
        informationLabel.numberOfLines = 0
        bringLabel.text = "\(bringTextLabel)"
        coastLabel.text = "\(coastTextLabel)"
    }
    
    
    @IBAction func buyButton(_ sender: Any) {
        for charachter in shopCharachters {
            if belly >= charachter.rarity.price {
                belly -= charachter.rarity.price
                allBelly.text = "\(belly)"
                
                availableCharachter.append(charachter)
                
                let allert = UIAlertController(title: "Congratulations!", message: "You bought this charachter, now you can meet him in the game.", preferredStyle: .alert)
                let okAllertAction = UIAlertAction(title: "Ok", style: .default)
                
                allert.addAction(okAllertAction)
                present(allert, animated: true)
                
                
                butButton.isHidden = true
                
            } else {
                let noAllert = UIAlertController(title: "Error", message: "You don't have enough money.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                
                noAllert.addAction(okAction)
                present(noAllert, animated: true)
            }
        }
    }
    
}
