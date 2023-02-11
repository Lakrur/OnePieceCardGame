//
//  InventoryEquipViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 11.02.2023.
//

import UIKit

class InventoryEquipViewController: UIViewController {

    @IBOutlet weak var passedImageView: UIImageView!
    @IBOutlet weak var passedLabel: UILabel!
    @IBOutlet weak var equip: UIButton!
    
    var imageRecieve = UIImage()
    var labelRecive = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passedLabel.numberOfLines = 0
        passedImageView.image = imageRecieve
        passedLabel.text = labelRecive
      
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        let sound = AudioService.shared
        sound.playSound(key: "error")
    }
    

    @IBAction func equipButtonAction(_ sender: Any) {
        for flag in availableFlags {
            currentlyUsedFlag.removeAll()
            currentlyUsedFlag.append(flag)
            print(currentlyUsedFlag)
    
        }
    }
}
