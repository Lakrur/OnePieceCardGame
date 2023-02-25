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
    
    var musicManager = MusicManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = AudioService.shared
        
        
        let userDefaults = UserDefaults.standard
        
        soundSlider.value = userDefaults.float(forKey: "playerVolume")
        sound.player.volume = userDefaults.float(forKey: "playerVolume")
        sound.player.volume = soundSlider.value
        
        musicSlider.value = userDefaults.float(forKey: "musicVolume")
        musicManager.audioPlayer?.volume = userDefaults.float(forKey: "musicVolume")
        musicManager.audioPlayer?.volume = musicSlider.value
        
        soundSlider.minimumTrackTintColor = UIColor(named: "SliderMin")
        musicSlider.minimumTrackTintColor = UIColor(named: "SliderMin")
        soundSlider.maximumTrackTintColor = UIColor(named: "SliderMax")
        musicSlider.maximumTrackTintColor = UIColor(named: "SliderMax")
        soundSlider.setThumbImage(UIImage(named: "den-den(on)"), for: .normal)
        musicSlider.setThumbImage(UIImage(named: "den-den(on)"), for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        musicManager.resumeMusic()
        
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
    
    
    @IBAction func soundAction(_ sender: UISlider) {
        let sound = AudioService.shared
        let userDefaults = UserDefaults.standard
        
        
        sound.player.volume = sender.value
        
        userDefaults.set(soundSlider.value, forKey: "playerVolume")
        userDefaults.set(sound.player.volume, forKey: "playerVolume")
        
        userDefaults.synchronize()
        
    }
    
    
    @IBAction func musicAction(_ sender: UISlider) {
        
        let userDefaults = UserDefaults.standard
        
        musicManager.audioPlayer?.volume = sender.value
        
        userDefaults.set(musicSlider.value, forKey: "musicVolume")
        userDefaults.set(musicManager.audioPlayer?.volume, forKey: "musicVolume")
        
        userDefaults.synchronize()
    }
    
}


class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
         let point = CGPoint(x: bounds.minX, y: bounds.midY)
         return CGRect(origin: point, size: CGSize(width: bounds.width, height: 20))
     }
}
