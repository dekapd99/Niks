//
//  Manage.swift
//  Niks
//
//  Created by Abner Edgar on 03/05/23.
//

import Foundation
import AVFoundation

struct Manager
{
   ///AVAudio Player
    static var player: AVAudioPlayer?
    do
    {
      try Manager.player = AVAudioPlayer.init(contentsOf: returnPathAtSelectedIndex(fileName: fileName))
      //Set required delegates and Values

      Manager.player?.delegate = self
      Manager.player?.volume = 1.0
      Manager.player?.prepareToPlay()
      Manager.player?.play()
    }
    catch
    {
      print("Error while playing music: \(error.localizedDescription)")
    }
}
