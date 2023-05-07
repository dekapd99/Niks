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

class AnimatorViewModel: ObservableObject {
    @Published var opt: Int = 0
    @Published var frame: Int = 0
    @Published var currentTime: CGFloat = 0
    @Published var delay: Int = 0
    @Published var prevPage: Int = 10
    @Published var isActive: Bool = true
    @Published var curIndex: Int = 0
    @Published var stretchView: Bool = false
    @Published var changed: Bool = true
    @Published var end: Bool = false
    @Published var showInfo: Bool = false
    @Published var activeMusic: Int = 0
    @Published var musicCrate: [MusicModel] = [
        MusicModel(name: Constant.Scenery.Night,
                   image: Constant.IconStyle.Piano),
        MusicModel(name: Constant.Scenery.Jazz,
                   image: Constant.IconStyle.Jazz),
        MusicModel(name: Constant.Scenery.Rain,
                   image: Constant.IconStyle.Rain),
        MusicModel(name: Constant.Scenery.Beach,
                   image: Constant.IconStyle.Beach),
        MusicModel(name: Constant.Scenery.Nature,
                   image: Constant.IconStyle.Nature),
        MusicModel(name: Constant.Scenery.River,
                   image: Constant.IconStyle.River)
    ]
    @Published var data: [AnimationModel] = [
        AnimationModel(animation: "UjayiBreath",
                       length: 32,
                       music: "VO_UjayyiBreath",
                       info: "Ujjayi Breath relieves sleeping difficulties, slows down the heart rate and lowers blood pressure."),
        AnimationModel(animation: "StandingHalfForwardBend",
                       length: 15,
                       music: "VO_StandingHalf",
                       info:"This exercise strengthens the back, lowers hypertension, increases blood circulation towards the head, replenishes the brain cells."),
        AnimationModel(animation: "StandingForwardBend",
                       length: 21,
                       music: "VO_Standing",
                       info:"Reduces stress, anxiety, depression and fatigue. Calms the mind and soothes the nerves. Relieves tension in the neck and back."),
        AnimationModel(animation: "WideKneeChildRose",
                       length: 1,
                       music: "VO_WideKneePose",
                       info:"Helps lower your blood pressure, enhances the quality of breathing, thus soothes the body as well as the mind."),
        AnimationModel(animation: "RecliningBoundAngle",
                       length: 1,
                       music: "VO_RecliningBound",
                       info:"Any type of mild depression, anxieties, tensions in the muscles are alleviated. This exercise also induces sleep."),
        AnimationModel(animation: "LegsUpTheWall",
                       length: 1,
                       music: "VO_LegsUp",
                       info:"This exercise with deep breathing can improve blood circulation, relax muscles, and reduce stress, tension, anxiety, and insomnia."),
        AnimationModel(animation: "LegsOnChair",
                       length: 1,
                       music: "VO_LegsChair",
                       info:"This exercise with deep breathing can improve blood circulation, relax muscles, and reduce stress, tension, anxiety, and insomnia."),
        AnimationModel(animation: "CorpsePose",
                       length: 18,
                       music: "VO_CorpsePose",
                       info:"Helps manage stress by activating the relaxation response and deactivating the stress response to the body and mind.")
    ]
    @Published var modelPos: [CGPoint] = [CGPoint(x: 0.65, y: 0.55),
                                          CGPoint(x: 0.66, y: 0.55),
                                          CGPoint(x: 0.5, y: 0.55),
                                          CGPoint(x: 0.5, y: 0.70),
                                          CGPoint(x: 0.5, y: 0.72),
                                          CGPoint(x: 0.565, y: 0.67),
                                          CGPoint(x: 0.55, y: 0.75),
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
