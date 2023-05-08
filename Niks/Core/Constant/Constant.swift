//
//  Constant.swift
//  Niks
//
//  Created by Abner Edgar on 02/05/23.
//

import Foundation
import SwiftUI

struct Constant {
    struct BackgroundImage {
        static let BackgroundHome: String = "BackgroundHome"
        static let BackgroundSleep: String = "BackgroundSleep"
        static let BackgroundStretch: String = "BackgroundStretch"
        static let BackgroundTotallySleep: String = "BackgroundTotallySleep"
    }
    
    struct ColorStyle {
        static let DarkPurple: Color = Color("DarkPurple")
        static let LightBlue: Color = Color("LightBlue")
        static let LightPink: Color = Color("LightPink")
        static let Purple: Color = Color("Purple")
        static let Pink: Color = Color("Pink")
        static let SoftBlack: Color = Color("SoftBlack")
        static let SoftWhite: Color = Color("SoftWhite")
        
    }
    struct IconStyle {
        //MARK: MISCELLANEOUS ICONS
        static let Speaker: String = "speaker.wave.3"
        static let SpeakerMute: String = "speaker.slash"
        static let XMark: String = "xmark.circle"
        static let IMark: String = "info.circle"
        static let Pause: String = "pause.fill"
        static let Play: String = "play.fill"
        //MARK: MUSIC ICONS
        static let Beach: String = "BeachIcon"
        static let Nature: String = "NatureIcon"
        static let Piano: String = "PianoIcon"
        static let Rain: String = "RainIcon"
        static let River: String = "RiverIcon"
        static let Jazz: String = "JazzIcon"
    }
    struct Objects {
        static let Homepod: String = "Homepod"
        static let Yogamat: String = "YogaMat"
    }
    
    struct Scenery {
        static let Jazz: String = "Jazz"
        static let Nature: String = "Nature"
        static let Beach: String = "Beach"
        static let Night: String = "Night"
        static let Rain: String = "Rain"
        static let River: String = "River"
        struct RainSeq {
            static let Rains: [String] = ["Rain1","Rain2","Rain3"]
        }
    }
    
    struct AnimationModel {
        static let Idle: [String] = ["Idle_Home_Screen-1",
                                     "Idle_Home_Screen-2",
                                     "Idle_Home_Screen-3",
                                     "Idle_Home_Screen-4",
                                     "Idle_Home_Screen-5",
                                     "Idle_Home_Screen-6",
                                     "Idle_Home_Screen-7",
                                     "Idle_Home_Screen-8",
                                     "Idle_Home_Screen-9",
                                     "Idle_Home_Screen-10",
                                     "Idle_Home_Screen-11",
                                     "Idle_Home_Screen-12",
                                     "Idle_Home_Screen-13",
                                     "Idle_Home_Screen-14",
                                     "Idle_Home_Screen-15",
                                     "Idle_Home_Screen-16",
                                     "Idle_Home_Screen-17",
                                     "Idle_Home_Screen-18",
                                     "Idle_Home_Screen-19",
        ]
    }
    
}
