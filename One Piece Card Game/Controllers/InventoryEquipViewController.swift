//
//  InventoryEquipViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 11.02.2023.
//

import UIKit
import RealmSwift

class InventoryEquipViewController: UIViewController {
    
    @IBOutlet weak var passedImageView: UIImageView!
    @IBOutlet weak var passedLabel: UILabel!
    @IBOutlet weak var equip: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var imageRecieve = UIImage()
    var labelRecive = String()
    var backgroundImageReceive = UIImage()
    
    var musicManager = MusicManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = AudioService.shared
        
        sound.player.volume = UserDefaults.standard.float(forKey: "playerVolume")
        
        passedLabel.numberOfLines = 0
        passedImageView.image = imageRecieve
        passedLabel.text = labelRecive
        backgroundImage.image = backgroundImageReceive
        
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
    
    
    @IBAction func equipButtonAction(_ sender: Any) {
        if let index = availableFlags.firstIndex(where: { UIImage(named: $0.picture) == imageRecieve }) {
            currentlyUsedFlag = availableFlags[index]
            showAlert(title: "Well done!", message: "Decoration applied successfully!")
            
        } else if let index = availableBackgrounds.firstIndex(where: { UIImage(named: $0.picture) == backgroundImageReceive }) {
            currentlyUsedBackground = availableBackgrounds[index]
            showAlert(title: "Well done!", message: "Decoration applied successfully!")
        }
    }
}
