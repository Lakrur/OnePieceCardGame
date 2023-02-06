//
//  SettingsViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 28.01.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
    @IBOutlet var audioLabels: [UILabel]!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var soundSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        soundSlider.minimumTrackTintColor = UIColor(named: "SliderMin")
        musicSlider.minimumTrackTintColor = UIColor(named: "SliderMin")
        soundSlider.maximumTrackTintColor = UIColor(named: "SliderMax")
        musicSlider.maximumTrackTintColor = UIColor(named: "SliderMax")
        soundSlider.setThumbImage(UIImage(named: "den-den(on)"), for: .normal)
        musicSlider.setThumbImage(UIImage(named: "den-den(on)"), for: .normal)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func soundAction(_ sender: Any) {
        let sound = Singleton.shared
        sound.player.volume = soundSlider.value
        
    }
    
    
}

class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
         let point = CGPoint(x: bounds.minX, y: bounds.midY)
         return CGRect(origin: point, size: CGSize(width: bounds.width, height: 20))
     }
}
