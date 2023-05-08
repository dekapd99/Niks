//
//  BackgroundExampleView.swift
//  Niks
//
//  Created by Deka Primatio on 26/04/23.
//

import SwiftUI

struct BackgroundExampleView: View {
    //MARK: - PROPERTIES
    @State var showSpotlight: Bool = false
    @State var currentSpotlight: Int = 0
    
    //MARK: - BODY
    var body: some View {
        
        //MARK: - ZSTACK (BACKGROUND & OBJECTS)
        ZStack {
            Image("BackgroundHome")
                .resizable()
                .scaledToFill()
            
            //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
            GeometryReader { geometry in
                Image("Homepod")
                    .pulsingAnimation()
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .addSpotlight(0, shape: .rectangle, roundedRadius: 10, text: "Homepod Music")
                    .position(x: geometry.size.width / 20, y: geometry.size.height / 1.65)
                    .onTapGesture {
                        print("homepod tapped")
                    }
                
                //                BubbleDialogueComponent()
                //                    .position(x: geometry.size.width / 2, y: geometry.size.height / 6)
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .addSpotlight(1, shape: .rectangle, roundedRadius: 10, text: "Homepod Music")
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
                
                Image("YogaMat")
                    .pulsingAnimation()
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .addSpotlight(2, shape: .rectangle, roundedRadius: 10, text: "Homepod Music")
                    .position(x: geometry.size.width / 1.17, y: geometry.size.height / 1.38)
                    .onTapGesture {
                        print("yogamat tapped")
                    }
            }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        }//: - ZSTACK (BACKGROUND & OBJECTS)
        .addSpotlightOverlay(show: $showSpotlight, currentSpot: $currentSpotlight)
        .onAppear {
            showSpotlight = true
        }
        
    }//: - BODY
}

//MARK: - PREVIEW
struct BackgroundExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundExampleView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
