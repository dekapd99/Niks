//
//  AnimatorViewModel.swift
//  Niks
//
//  Created by Abner Edgar on 06/05/23.
//

import Foundation

struct AnimationModel: Codable, Hashable, Equatable {
    let animation: String
    let length: Int
    let music: String
    let info: String
    let animationImageNames: [String]
    
    init(animation: String, length: Int, music: String, info: String) {
        self.animation = animation
        self.length = length
        self.animationImageNames = (0...length).map({"\(animation)-\($0)"})
        self.music = music
        self.info = info
    }
}
