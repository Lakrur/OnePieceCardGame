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
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func buyButton(_ sender: Any) {
        if let index = shopCharachters.firstIndex(where: { $0.picture == imageReceived && !$0.isPurchased }) {
            if belly >= shopCharachters[index].rarity.price {
                belly -= shopCharachters[index].rarity.price
                allBelly.text = "\(belly)"
                availableCharachter.append(shopCharachters[index])
                shopCharachters[index].isPurchased = true
                print(availableCharachter)
                
                showAlert(title: "Congratulations!", message: "You bought this charachter, now you can meet him in the game.")
            } else {
                showAlert(title: "Error", message: "You don't have enough money.")
            }
        } else {
            showAlert(title: "Error", message: "This charachter is already bought.")
        }
    }
}
