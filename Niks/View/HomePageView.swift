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
    //MARK: - BODY
    var body: some View {
        //MARK: - ZSTACK (BACKGROUND & OBJECTS)
        ZStack {
            Image(Constant.Scenery.Piano)
                .resizable()
            
            Image(Constant.BackgroundImage.BackgroundHome)
                .resizable()
                .scaledToFill()
                .foregroundColor(.white)

            DimmerView()
                .onTapGesture {
                    SideBar = false
                }
            
            //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
            GeometryReader { geometry in
                Image(Constant.Objects.Homepod)
                    .pulsingAnimation()
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .position(x: geometry.size.width / 20, y: geometry.size.height / 1.65)
                    .onTapGesture {
                        SideBar.toggle()
                    }
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
                
                Image(Constant.Objects.Yogamat)
                    .pulsingAnimation()
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .position(x: geometry.size.width / 1.17, y: geometry.size.height / 1.38)
                    .onTapGesture {
                        previewStretch = true
                    }
                
                SidebarComponent(toggle: $SideBar,
                                 bounds: CGPoint(
                                    x: geometry.size.width,
                                    y:geometry.size.height),
                                 colorgrad:Constant.ColorStyle.SoftWhite)
            }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        }//: - ZSTACK (BACKGROUND & OBJECTS)
        
    }//: - BODY
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(previewStretch: .constant(false))
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
