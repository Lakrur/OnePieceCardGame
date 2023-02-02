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
    
    
    
    var imageReceived = UIImage()
    var information = String()
    var buttonText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passedImageView.image = imageReceived
        informationLabel.text = "\(information)"
        informationLabel.numberOfLines = 0
        
    }
    

    @IBAction func buyButton(_ sender: Any) {
        for charachter in shopCharachters {
            if belly >= charachter.price {
                availableCharachter.append(charachter)
                
                
                belly -= charachter.price
                allBelly.text = "\(belly)"
                
                let allert = UIAlertController(title: "Congratulations!", message: "You bought this charachter, now you can meet him in the game.", preferredStyle: .alert)
                let okAllertAction = UIAlertAction(title: "Ok", style: .default)
                
                allert.addAction(okAllertAction)
                present(allert, animated: true)
                
                print("good")
                
                butButton.isHidden = true
                
            } else {
                let noAllert = UIAlertController(title: "Error", message: "You don't have enough money.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)

                noAllert.addAction(okAction)
                present(noAllert, animated: true)
                
                print("bad")
            }
        }
    }
    
}
