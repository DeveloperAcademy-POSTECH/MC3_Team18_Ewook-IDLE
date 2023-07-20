//
//  SoundEffectPlayer.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/19/23.
//

import SwiftUI
import AVKit

class SoundEffectPlayer {
    static let shared = SoundEffectPlayer()
    var audioPlayer: AVAudioPlayer?

    func playSoundEffect(soundName: String) {
        if let bundle = Bundle.main.path(forResource: soundName, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopSoundEffect(){
        audioPlayer?.stop()
    }
}
