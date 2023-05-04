//
//  AudioPlayerModel.swift
//  Niks
//
//  Created by Abner Edgar on 04/05/23.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject  {
    var audioPlayer: AVAudioPlayer?
    
    func playSound(sound: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

}
