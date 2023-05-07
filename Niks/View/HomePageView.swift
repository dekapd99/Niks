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
    
    @State private var textIndex = 0
    @State private var showBubble = false
    @State private var hasShownAnimation = false
    
    private let texts = [
        "",
        "You can start stretching by tapping on the Yoga Mat",
        "You can also change the background music by tapping on the Speaker.",
        "When you change the background music, the scenery outside the window will also change accordingly.",
        "*Yawn* \nLet’s set you up to sleep by tapping on the Yoga Mat."
    ]
    
    //MARK: - BODY
    var body: some View {
        //MARK: - ZSTACK (BACKGROUND & OBJECTS)
        ZStack {
            Image(viewModel.musicCrate[viewModel.activeMusic].name)
                .resizable()
                .ignoresSafeArea()
            
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
                
                if showBubble {
                    BubbleDialogueComponent(text: texts[textIndex])
                        .transition(.scale)
                        .animation(.easeInOut(duration: 0.5))
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 6.5)
                        .opacity(textIndex < texts.count ? 1 : 0)
                }
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .addSpotlight(1, shape: .rectangle, roundedRadius: 10, text: "")
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
                    .onTapGesture {
                        withAnimation {
                            if !hasShownAnimation {
                                showBubble = true
                                hasShownAnimation = true
                            } else if textIndex == texts.count - 1 {
                                showBubble = false
                                hasShownAnimation = false
                            }
                            textIndex = (textIndex + 1) % texts.count
                        }
                    }

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
