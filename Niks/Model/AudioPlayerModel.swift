//
//  AudioPlayerModel.swift
//  Niks
//
//  Created by Abner Edgar on 03/05/23.
//

import Foundation
import UIKit
import AVFoundation

class AudioPlayer: ObservableObject  {
    var player: AVAudioPlayer?
    func playSong(title: String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "mp3")
        else {
            print("Failed to find file with name: \(title)")
            return
        }
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(AVAudioSession.Category.playback
            )
            // Attempts to activate session so you can play audio,
            // if other sessions have priority this will fail
            try AVAudioSession.sharedInstance().setActive(true)
        } catch{
            // Handle error
            print("Failed to play song: \(error.localizedDescription)")
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = 2 //play this audio on loop forever
            player?.play()
        } catch {
            print("Failed to play song: \(error.localizedDescription)")
        }
    }
}
