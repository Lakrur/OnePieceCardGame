//
//  DecorDetailShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 10.02.2023.
//

import UIKit
import RealmSwift

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
    
    var musicManager = MusicManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = AudioService.shared
        
        sound.player.volume = UserDefaults.standard.float(forKey: "playerVolume")
        
        decorLabel.numberOfLines = 0
        priceLabel.numberOfLines = 0
        decorImage.image = imageRecive
        decorLabel.text = labelRecive
        priceLabel.text = "The cost of this decoration: \(formatNumber(number: Int(priceRecive)!)) belly"
        backgroundImage.image = backgroundImageRecive
        
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
        if let index = shopFlags.firstIndex(where: { UIImage(named: $0.picture) == imageRecive && !$0.isPurchased }) {
            let realm = try! Realm()
            if let purchasedFlags = realm.objects(FlagModel.self).filter("id == \(shopFlags[index].id) AND isPurchased == true", shopFlags[index].picture).first {
                showAlert(title: "Error", message: "You already own this background.")
            } else if belly >= shopFlags[index].price {
                try! realm.write {
                    let saveFlags = FlagModel()
                    saveFlags.picture = shopFlags[index].picture
                    saveFlags.isPurchased = true
                    saveFlags.id = shopFlags[index].id
                    saveFlags.flagDescription = shopFlags[index].flagDescription
                    availableFlags.append(shopFlags[index])
                    showAlert(title: "Congratulations!", message: "Now you can use this decoration by selecting it in your inventory.")
                    realm.add(saveFlags)
                }
                    belly -= shopFlags[index].price
                    allBelly.text = "\(formatNumber(number: belly))"
                    let realm = try! Realm()
                    try! realm.write {
                        let bellyData = realm.objects(BellyData.self).first!
                        bellyData.value = belly
                    }
                    availableFlags.append(shopFlags[index])
                    shopFlags[index].isPurchased = true
                } else {
                    showAlert(title: "Error", message: "You don't have enough money.")
                }
        }  else if let index = shopBackgrounds.firstIndex(where: { UIImage(named: $0.picture) == backgroundImageRecive && !$0.isPurchased }) {
                let realm = try! Realm()
    if let purchasedBackground = realm.objects(GameBackgroundModel.self).filter("id == \(shopBackgrounds[index].id) AND isPurchased == true", shopBackgrounds[index].picture).first {
        showAlert(title: "Error", message: "You already own this background.")
    } else if belly >= shopBackgrounds[index].price {
                    let realm = try! Realm()
                    try! realm.write {
                        let saveBackground = GameBackgroundModel()
                        saveBackground.id = shopBackgrounds[index].id
                        saveBackground.picture = shopBackgrounds[index].picture
                        saveBackground.isPurchased = true
                        availableBackgrounds.append(shopBackgrounds[index])
                        showAlert(title: "Congratulations!", message: "Now you can use this decoration by selecting it in your inventory.")
                        realm.add(saveBackground)
                    }
                    belly -= shopBackgrounds[index].price
                    allBelly.text = "\(formatNumber(number: belly))"
                    try! realm.write {
                        let bellyData = realm.objects(BellyData.self).first!
                        bellyData.value = belly
                    }
                } else {
                    showAlert(title: "Error", message: "You don't have enough money.")
                }
            } else {
                showAlert(title: "Error", message: "You can't buy this item.")
            }
        }
    }
       
