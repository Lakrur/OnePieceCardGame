//
//  ViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var flippedCharachter: (character: AllCharachter, button: UIButton)?
   
    
    
    
    var charachterCollection: [AllCharachter] = []
    
    // MARK: reset flipped card
    func resetCard() {
        for button in buttonCollection {
            button.setImage(UIImage(named: "flag"), for: .normal)
            button.isEnabled = true
        }
    }
    
    // MARK: func flip button
    
    func flipButton(charchter: AllCharachter, button: UIButton) {
        
        if button.currentImage == charchter.picture {
            button.setImage(UIImage(named: "flag"), for: .normal)
            UIView.transition(with: button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
            button.isEnabled = true
        } else {
            button.setImage(charchter.picture, for: .normal)
            UIView.transition(with: button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
            button.isEnabled = false
        }
    }
    
    // MARK: Outlet var's
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var bellyCounter: UILabel!
    @IBOutlet weak var rightSideMenu: UIView!
    @IBOutlet weak var rightSideTrallingAnchor: NSLayoutConstraint!
    @IBOutlet weak var leftSideMenu: UIView!
    @IBOutlet weak var leftSideMenuLeadingAnchor: NSLayoutConstraint!
    
    // MARK: func viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allBelly = bellyCounter
        
        charachterCollection = availableCharachter + availableCharachter
        availableCharachter = availableCharachter.shuffled()
        
        // MARK: Menu
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        rightSideMenu.addGestureRecognizer(tapGesture )
    }
    
    
    @objc func tapGestureAction() {
        leftSideMenuLeadingAnchor.constant = -300
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        DispatchQueue.main.async {
            self.rightSideTrallingAnchor.constant = 180
        }
    }
    
    // MARK: Locking Orientation: Portrait
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    
    // MARK: Card Buttons
    @IBAction func buttonAction(_ sender: UIButton) {
        let buttonIndex = buttonCollection.firstIndex(of: sender)!
        flipButton(charchter: (charachterCollection)[buttonIndex], button: sender)
        
        
        guard let flippedCharachter = flippedCharachter else {
            flippedCharachter = ((charachterCollection)[buttonIndex], sender)
            return
        }
        
        for button in buttonCollection {
            button.isEnabled = false
        }
        
        if flippedCharachter.character.id == (charachterCollection)[buttonIndex].id {
            belly += 200
            allBelly.text = ": \(belly)"
            charachterCollection.shuffle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.flippedCharachter = nil
            self.resetCard()
            UIView.transition(with:  flippedCharachter.button, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with:  sender, duration: 0.3,options:  .transitionFlipFromLeft, animations: nil, completion: { _ in
                for button in self.buttonCollection {
                    button.isEnabled = true
                }
            })
        }
    }
    
    // MARK: Menu Button Action
    
    @IBAction func menuButtonAction(_ sender: Any) {
        leftSideMenuLeadingAnchor.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.rightSideTrallingAnchor.constant = 0
        }
    }
    
    // MARK: Menu Buttons
    
    
    @IBAction func continuePlay(_ sender: Any) {
        tapGestureAction()
    }
    
    
    
}





