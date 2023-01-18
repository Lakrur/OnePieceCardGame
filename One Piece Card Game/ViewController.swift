//
//  ViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 16.01.2023.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var player: AVPlayer!
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
            
        }
    }
    
    func flipButton(charchter: UIImage, button: UIButton) {
        if button.currentImage == charchter {
             button.setImage(UIImage(named: "flag"), for: .normal)
            UIView.transition(with: button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            button.setImage(charchter, for: .normal)
            UIView.transition(with: button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
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
        
        
        @IBOutlet weak var soundButton: UIButton!
        @IBOutlet weak var touchLabel: UILabel!
        @IBOutlet var buttonCollection: [UIButton]!
        @IBOutlet weak var resetTouches: UIButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!))
            
            soundButton.setImage(UIImage(named: "den-den(off)"), for: .normal)
        }
    
    // Locking Orientation: Portrait
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    // Sound Button
    @IBAction func soundButtonAction(_ sender: UIButton) {
        
        if player.timeControlStatus == .playing {
            player.pause()
            soundButton.setImage(UIImage(named: "den-den(off)"), for: .normal)
        } else {
            player.play()
            soundButton.setImage(UIImage(named: "den-den(on)"), for: .normal)
        }
    }
    
    // Reset Touches Button
    @IBAction func resetButtonAction(_ sender: UIButton) {
        touches = 0
        touchLabel.text = "Touches: \(touches)"
        
    }
    
    
        // Card Buttons
        @IBAction func buttonAction(_ sender: UIButton) {
            
            touches += 1
            let buttonIndex = buttonCollection.firstIndex(of: sender)!
            flipButton(charchter: charachterCollection[buttonIndex]!, button: sender)
        }
    }

