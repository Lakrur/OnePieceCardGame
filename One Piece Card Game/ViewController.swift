//
//  ViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 16.01.2023.
//

import UIKit
import MediaPlayer


class ViewController: UIViewController {
    
    var flippedCharachter: Charachter?
    var player: AVPlayer!
    var belly = 0 {
        didSet {
            bellyCounter.text = ": \(belly)"
        }
    }
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
            
        }
    }
    
    struct Charachter {
        var id: Int
        var picture: UIImage
    }
    
    
    var charachterCollection: [Charachter] =
    [Charachter(id: 1, picture: UIImage(named: "luffy")!),
     Charachter(id: 1, picture: UIImage(named: "luffy")!),
     Charachter(id: 2, picture: UIImage(named: "zoro")!),
     Charachter(id: 2, picture: UIImage(named: "zoro")!),
     Charachter(id: 3, picture: UIImage(named: "brook")!),
     Charachter(id: 3, picture: UIImage(named: "brook")!),
     Charachter(id: 4, picture: UIImage(named: "usopp")!),
     Charachter(id: 4, picture: UIImage(named: "usopp")!),
     Charachter(id: 5, picture: UIImage(named: "whitebeard")!),
     Charachter(id: 5, picture: UIImage(named: "whitebeard")!)].shuffled()
    
    // reset flipped card
    func resetCard() {
        for button in buttonCollection {
            button.setImage(UIImage(named: "flag"), for: .normal)
        }
    }
    
    // func flip button
    
    func flipButton(charchter: Charachter, button: UIButton) {
        
        if button.currentImage == charchter.picture {
            button.setImage(UIImage(named: "flag"), for: .normal)
            UIView.transition(with: button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            button.setImage(charchter.picture, for: .normal)
            UIView.transition(with: button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    
    //Outlet var's
    
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var resetTouches: UIButton!
    @IBOutlet weak var bellyCounter: UILabel!
    
    // func viewDidLoad
    
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

    //
    
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
        UIView.transition(with: self.resetTouches, duration: 0.4,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    
    // Card Buttons
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        let buttonIndex = buttonCollection.firstIndex(of: sender)!
        flipButton(charchter: charachterCollection[buttonIndex], button: sender)
        
        guard let flippedCharachter = flippedCharachter else {
            flippedCharachter = charachterCollection[buttonIndex]
    
            return
            
        }
        if flippedCharachter.id == charachterCollection[buttonIndex].id {
            
            belly += 10
        }
        
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.flippedCharachter = nil
                self.resetCard()
            //UIView.transition(with: sender, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
}

