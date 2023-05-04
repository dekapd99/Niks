//
//  AudioPlayerExampleView.swift
//  Niks
//
//  Created by Abner Edgar on 03/05/23.
//

import SwiftUI
import AVFoundation

class AudioPlayerExampleView: View {
    var audioPlayer: AVAudioPlayer?
        @State private var isPlaying = false
        
        var body: some View {
            VStack {
                Button(action: {
                    if isPlaying {
                        audioPlayer?.pause()
                    } else {
                        audioPlayer?.play()
                    }
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                        .font(.system(size: 80))
                }
            }
            .onAppear {
                guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.numberOfLoops = -1 // infinite loop
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            }
        }
}

struct AudioPlayerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerExampleView()
    }
}
