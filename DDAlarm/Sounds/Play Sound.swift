//
//  Play Sound.swift
//  DDAlarm
//
//  Created by joe on 4/9/25.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer? = AVAudioPlayer()

// play sound with a default value
// set to 1.0
func playSound(sound: String, type: String = "", volume: Float = 1.0) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // set the volume
            audioPlayer?.setVolume(volume, fadeDuration: 0.1)
            
            // play the sound
            audioPlayer?.play()
        } catch {
            print("AUDIO ERROR")
        }
    }
}

func stopPlaying() {
    audioPlayer?.stop()
}
