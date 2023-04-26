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
            Image("background-home")
                .resizable()
                .scaledToFill()
            
            //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
            GeometryReader { geometry in
                Image("homepod")
                    .position(x: geometry.size.width / 18, y: geometry.size.height / 1.6)
                    .onTapGesture {
                        print("homepod tapped")
                    }
                
                Image("character")
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.8)
                
                Image("yoga-mat")
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
