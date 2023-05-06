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
    
    static let shared = AudioPlayer()
    
    func playSound(sound: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

    func playpause(){
        guard let player = audioPlayer else{
            print("Instance of audi player no found")
            return
        }

        if player.isPlaying{
            player.pause()
          
        }else{
            player.play()
           

        }
    }
    
    

}
