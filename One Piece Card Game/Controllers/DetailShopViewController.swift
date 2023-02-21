//
//  DetailShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 01.02.2023.
//

import UIKit
import Foundation
import RealmSwift

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
    
    var musicManager = MusicManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = AudioService.shared
        
        sound.player.volume = UserDefaults.standard.float(forKey: "playerVolume")
        
        passedImageView.image = imageReceived
        informationLabel.text = "\(information)"
        informationLabel.numberOfLines = 0
        bringLabel.text = "Charachter will bring: \(formatNumber(number: Int(bringTextLabel)!)) belly"
        coastLabel.text = "Charachter price: \(formatNumber(number: Int(coastTextLabel)!)) belly"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        musicManager.resumeMusic()
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        let sound = AudioService.shared
        sound.playSound(key: "error")
        sound.player.volume = UserDefaults.standard.float(forKey: "playerVolume")
    }
    
    @IBAction func buyButton(_ sender: Any) {
        if let index = shopCharachters.firstIndex(where: { $0.picture == imageReceived && !$0.isPurchased }) {
            if belly >= shopCharachters[index].rarity.price {
                belly -= shopCharachters[index].rarity.price
                allBelly.text = "\(formatNumber(number: belly))"
                let realm = try! Realm()
                try! realm.write {
                    let bellyData = BellyData()
                    bellyData.value = belly
                    realm.add(bellyData)
                }
                availableCharachter.append(shopCharachters[index])
                shopCharachters[index].isPurchased = true
                
                showAlert(title: "Congratulations!", message: "You bought this charachter, now you can meet him in the game.")
            } else {
                showAlert(title: "Error", message: "You don't have enough money.")
            }
        } else {
            showAlert(title: "Error", message: "This charachter is already bought.")
        }
    }
}
