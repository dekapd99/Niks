//
//  HomePageView.swift
//  Niks
//
//  Created by Abner Edgar on 03/05/23.
//

import SwiftUI
import WatchConnectivity

struct HomePageView: View {
    //MARK: - PROPERTIES
    @State var SideBar: Bool = false
    @State private var isShrink = false
    @Binding var previewStretch: Bool
    @ObservedObject var viewModel: AnimatorViewModel
    
    @AppStorage("showSpotlightOnce") var showSpotlightOnce: Bool = true
    @State var showSpotlight: Bool = false
    @State var currentSpotlight: Int = 0
    
    private let texts = [
        "You can start stretching by \ntapping on the Yoga Mat.",
        "You can also change the background \nmusic by tapping on the Speaker.",
        "When you change the background music, \nthe scenery outside the window will \nalso change accordingly.",
        "Let’s set you up to sleep *yawn*"
    ]
    
    //MARK: - BODY
    var body: some View {
        //MARK: - ZSTACK (BACKGROUND & OBJECTS)
        ZStack {
            Image(viewModel.musicCrate[viewModel.activeMusic].name)
                .resizable()
            
            Image(Constant.BackgroundImage.BackgroundHome)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            DimmerView()
                .onTapGesture {
                    SideBar = false
                }
            
            //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
            GeometryReader { geometry in
                Image(Constant.Objects.Homepod)
                    .pulsingAnimation()
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .addSpotlight(0, shape: .rectangle, roundedRadius: 10, text: "")
                    .position(x: geometry.size.width / 20, y: geometry.size.height / 1.65)
                    .onTapGesture {
                        SideBar.toggle()
                    }
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .addSpotlight(1, shape: .rectangle, roundedRadius: 10, text: "")
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
                
                Image(Constant.Objects.Yogamat)
                    .pulsingAnimation()
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .addSpotlight(2, shape: .rectangle, roundedRadius: 10, text: "")
                    .position(x: geometry.size.width / 1.17, y: geometry.size.height / 1.38)
                    .onTapGesture {
                        previewStretch = true
                    }
                
                SidebarComponent(toggle: $SideBar,
                                 viewModel: viewModel,
                                 bounds: CGPoint(
                                    x: geometry.size.width,
                                    y:geometry.size.height),
                                 colorgrad:Constant.ColorStyle.SoftWhite)
            }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        }//: - ZSTACK (BACKGROUND & OBJECTS)
        .addSpotlightOverlay(show: $showSpotlight, currentSpot: $currentSpotlight)
        .onAppear {    
            if showSpotlightOnce {
                showSpotlight = true
                showSpotlightOnce = false
            }
        }
        
    }//: - BODY
}

//struct HomePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePageView(previewStretch: .constant(false))
//            .previewInterfaceOrientation(.landscapeLeft)
//            .previewLayout(.sizeThatFits)
//    }
//}
