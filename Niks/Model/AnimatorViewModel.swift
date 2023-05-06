//
//  AnimatorViewModel.swift
//  Niks
//
//  Created by Abner Edgar on 06/05/23.
//

import Foundation

struct AnimationModel: Hashable, Equatable {
    let animation: String
    let length: Int
    let music: String
    let animationImageNames: [String]
    
    init(animation: String, length: Int, music: String) {
        self.animation = animation
        self.length = length
        self.animationImageNames = (0...length).map({"\(animation)-\($0)"})
        self.music = music
    }
}

class AnimatorViewModel: ObservableObject {
    @Published var opt: Int = 0
    @Published var frame: Int = 0
    @Published var currentTime: CGFloat = 0
    @Published var delay: Int = 0
    @Published var buffer: Int = 0
    @Published var prevPage: Int = 10
    @Published var isActive: Bool = true
    @Published var curIndex: Int = 0
    @Published var stretchView: Bool = false
    @Published var changed: Bool = true
    @Published var end: Bool = false
    @Published var data: [AnimationModel] = [
        AnimationModel(animation: "UjayiBreath", length: 32, music: "VO_UjayyiBreath"),
        AnimationModel(animation: "StandingHalfForwardBend", length: 15, music: "VO_StandingHalf"),
        AnimationModel(animation: "StandingForwardBend", length: 21, music: "VO_Standing"),
        AnimationModel(animation: "WideKneeChildRose", length: 1, music: "VO_WideKneePose"),
        AnimationModel(animation: "RecliningBoundAngle", length: 1, music: "VO_RecliningBound"),
        AnimationModel(animation: "LegsUpTheWall", length: 1, music: "VO_LegsUp"),
        AnimationModel(animation: "LegsOnChair", length: 1, music: "VO_LegsChair"),
        AnimationModel(animation: "CorpsePose", length: 18, music: "VO_CorpsePose")
    ]
    @Published var modelPos: [CGPoint] = [CGPoint(x: 0.65, y: 0.55),
                                          CGPoint(x: 0.66, y: 0.55),
                                          CGPoint(x: 0.5, y: 0.55),
                                          CGPoint(x: 0.5, y: 0.70),
                                          CGPoint(x: 0.5, y: 0.72),
                                          CGPoint(x: 0.565, y: 0.67),
                                          CGPoint(x: 0.65, y: 0.75),
                                          CGPoint(x: 0.50, y: 0.7)]
    func decrementTime() -> () {
        if isActive {
            if delay >= 10 {
                delay = 0
                currentTime = currentTime <= 0 ? 0 : currentTime - 1
            }else{
                delay += 1
            }
        }
    }
    func incrementTime() -> () {
        if isActive {
//            currentTime = currentTime >= timer ? timer : currentTime + 1
        }
    }
    func getOperation() -> () {
        guard opt >= 0 || opt < 2 else { return }
        if opt == 1 {
            incrementTime()
        }else {
            decrementTime()
        }
    }
    func playAnimation() {
        if frame < data[curIndex].length - 1 {
            frame += 1
        } else {
            frame = 0
        }
    }
    func incrementCurIndex() -> () {
        curIndex += 1
        if curIndex > 7 {
            curIndex = 7
            end = true
        }
    }
}
