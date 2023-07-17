//
//  MusicPlayer.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/17/23.
//

import SwiftUI
import AVKit

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic(musicName: String) {
        if let bundle = Bundle.main.path(forResource: musicName, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic(){
        audioPlayer?.stop()
    }
}
