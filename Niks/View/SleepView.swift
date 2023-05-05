//
//  SleepView.swift
//  Niks
//
//  Created by Deka Primatio on 05/05/23.
//

import SwiftUI

struct SleepView: View {
    var body: some View {
        
        ZStack {
            Image(Constant.BackgroundImage.BackgroundSleep)
                .resizable()
                .scaledToFill()
            
            GeometryReader { geometry in
                BubbleDialogueComponent(text: "test")
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 6.5)
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
            }
        }
        
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
