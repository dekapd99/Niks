//
//  BubbleDialogueComponent.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct BubbleDialogueComponent: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("BubbleTriangle")
                    .position(x: geometry.size.width / 1.6, y: geometry.size.height / 1.66)
            }
            
            RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                .frame(width: 660, height: 152)
                .foregroundColor(Color("LightPink"))
            
            Text("Take a deep breath... \n Exhale...")
                .titleStyle()
                .frame(width: 450, height: 150)
        }
            
    }//: - BODY
}

//MARK: - PREVIEW
struct BubbleDialogueComponent_Previews: PreviewProvider {
    static var previews: some View {
        BubbleDialogueComponent()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
