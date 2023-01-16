//
//  ViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    func flipButton(charchter: UIImage, button: UIButton) {
        if button.currentImage == charchter {
            button.setImage(UIImage(named: "flag"), for: .normal)
        } else {
            button.setImage(charchter, for: .normal)
        }
    }
        
    let charachterCollection =
    [UIImage(named: "luffy"),
     UIImage(named: "usopp"),
     UIImage(named: "brook"),
     UIImage(named: "whitebeard"),
     UIImage(named: "zoro"),
     UIImage(named: "usopp"),
     UIImage(named: "luffy"),
     UIImage(named: "brook"),
     UIImage(named: "whitebeard"),
     UIImage(named: "zoro")]
        
        
        
        @IBOutlet weak var touchLabel: UILabel!
        @IBOutlet var buttonCollection: [UIButton]!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        @IBAction func buttonAction(_ sender: UIButton) {
            touches += 1
            let buttonIndex = buttonCollection.firstIndex(of: sender)!
            flipButton(charchter: charachterCollection[buttonIndex]!, button: sender)
        }
    }


