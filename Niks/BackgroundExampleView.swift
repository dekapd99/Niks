//
//  BackgroundExampleView.swift
//  Niks
//
//  Created by Deka Primatio on 26/04/23.
//

import SwiftUI

struct BackgroundExampleView: View {
    //MARK: - PROPERTIES
    
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
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .position(x: geometry.size.width / 20, y: geometry.size.height / 1.65)
                    .onTapGesture {
                        print("homepod tapped")
                    }
                
//                BubbleDialogueComponent()
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 6)
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
                
                Image("YogaMat")
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .position(x: geometry.size.width / 1.17, y: geometry.size.height / 1.38)
                    .onTapGesture {
                        print("yogamat tapped")
                    }
            }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        }//: - ZSTACK (BACKGROUND & OBJECTS)
        
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
