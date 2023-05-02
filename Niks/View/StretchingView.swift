//
//  StretchingView.swift
//  Niks
//
//  Created by Abner Edgar on 02/05/23.
//

import SwiftUI

struct StretchingView: View {
    var body: some View {
        @State var toggle: Bool = false
        GeometryReader { geometry in
            ZStack{
                Image(Constant.BackgroundImage.BackgroundStretch)
                VStack {
                    HStack {
                        Spacer()
                        Image("StretchTitle")
                            .resizable()
                            .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.15)
                            
                    }
                    .padding(.bottom, geometry.size.height * 0.05)
                    HStack {
                        Spacer()
                        TimerComponent(timer: 60,
                                       colorgrad: Constant.ColorStyle.Purple,
                                       diameter: geometry.size.width * 0.1,
                                       wideness: geometry.size.width * 0.02)
                            .padding(.trailing, geometry.size.width * 0.025)
                    }
                    Spacer()
                }
                BubbleDialogueComponent()
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.12)
                HStack{
                    Spacer()
                    ButtonComponent(
                        rounded: true,
                        colorgrad: Constant.ColorStyle.DarkPurple,
                        doThis: {})
//                    .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.15)
                }
                .padding()
                
                
            }
            .ignoresSafeArea()
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
        }
        
    }
}

struct StretchingView_Previews: PreviewProvider {
    static var previews: some View {
        StretchingView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
