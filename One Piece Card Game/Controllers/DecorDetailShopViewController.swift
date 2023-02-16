//
//  DecorDetailShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 10.02.2023.
//

import UIKit

class DecorDetailShopViewController: UIViewController {
    
    @IBOutlet weak var decorImage: UIImageView!
    @IBOutlet weak var decorLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var labelRecive = String()
    var imageRecive = UIImage()
    var priceRecive = String()
    var backgroundImageRecive = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decorLabel.numberOfLines = 0
        priceLabel.numberOfLines = 0
        decorImage.image = imageRecive
        decorLabel.text = labelRecive
        priceLabel.text = "The cost of this decoration: \(formatNumber(number: Int(priceRecive)!)) belly"
        backgroundImage.image = backgroundImageRecive
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        let sound = AudioService.shared
        sound.playSound(key: "error")
    }
    
    @IBAction func buyButton(_ sender: Any) {
        if let index = shopFlags.firstIndex(where: { $0.picture == imageRecive && !$0.isPurchased }) {
            if belly >= shopFlags[index].price {
                belly -= shopFlags[index].price
                allBelly.text = "\(formatNumber(number: belly))"
                availableFlags.append(shopFlags[index])
                shopFlags[index].isPurchased = true
                
                showAlert(title: "Congratulations!", message: "Now you can use this decoration by selecting it in your inventory.")
            } else {
                showAlert(title: "Error", message: "You don't have enough money.")
            }
        }  else if let index = shopBackgrounds.firstIndex(where: { $0.picture == backgroundImageRecive && !$0.isPurchased }) {
            if belly >= shopBackgrounds[index].price {
                belly -= shopBackgrounds[index].price
                allBelly.text = "\(formatNumber(number: belly))"
                availableBackgrounds.append(shopBackgrounds[index])
                shopBackgrounds[index].isPurchased = true
                
                showAlert(title: "Congratulations!", message: "Now you can use this decoration by selecting it in your inventory.")
            } else {
                showAlert(title: "Error", message: "You don't have enough money.")
            }
        } else {
            showAlert(title: "Error", message: "This decoration is already bought.")
        }
    }
}

