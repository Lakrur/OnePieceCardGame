//
//  Sounds.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 04.02.2023.
//

import UIKit
import AVFoundation

final class Singleton {
    
    
    static let shared = Singleton()
    var player: AVAudioPlayer!
    
    func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print("error")
        }
    }
}


