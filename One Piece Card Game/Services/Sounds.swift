//
//  Sounds.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 04.02.2023.
//

import UIKit
import AVFoundation

final class AudioService {
    
    
    static let shared = AudioService()
    var player = AVAudioPlayer()
    
    
    func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch {
            print("error")
        }
    }
}

class MusicManager {
    static let shared = MusicManager()
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool {
        return audioPlayer?.isPlaying ?? false
    }
    
    func playMusic() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Error playing music: \(error.localizedDescription)")
        }
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
    }
    
    func resumeMusic() {
        audioPlayer?.play()
    }
    
    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}
