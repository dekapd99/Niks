//
//  StretchingView.swift
//  Niks
//
//  Created by Abner Edgar on 02/05/23.
//

import SwiftUI

struct StretchingView: View {
    @State var toggle: Bool = true
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image(Constant.BackgroundImage.BackgroundStretch)
                VStack {
                    StretchTitleView(geometry: geometry)
                    StretchTimerView(geometry: geometry, toggle: $toggle)
                    Spacer()
                    StretchPauseView(geometry: geometry, toggle: $toggle)
                }
                BubbleDialogueComponent(text: Dialogue.Stretching.Prompt[0])
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 0.12)
            }
            .ignoresSafeArea()
            .position(x: geometry.size.width/2,
                      y: geometry.size.height/2)
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


struct StretchTitleView: View {
    var geometry: GeometryProxy
    var body: some View {
        HStack {
            Spacer()
            Image("StretchTitle")
                .resizable()
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.15)
                .overlay{
                    Text(Dialogue.Stretching.Title[0])
                        .titleStyle()
                        .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.15)
                }
        }
        .padding(.bottom, geometry.size.height * 0.05)
    }
}

struct StretchTimerView: View {
    var geometry: GeometryProxy
    @Binding var toggle: Bool
    var body: some View {
        HStack {
            Spacer()
            TimerComponent(
                timer: 60,
                colorgrad: Constant.ColorStyle.Purple,
                diameter: geometry.size.width * 0.1,
                wideness: geometry.size.width * 0.02,
                isActive: $toggle)
                .padding(.trailing, geometry.size.width * 0.025)
        }
    }
}

struct StretchPauseView: View {
    var geometry: GeometryProxy
    @Binding var toggle: Bool
    var body: some View {
        HStack{
            Spacer()
            ButtonComponent(
                rounded: true,
                colorgrad: Constant.ColorStyle.DarkPurple,
                doThis: {
                    toggle.toggle()
                })
        }
        .padding(.trailing, geometry.size.width * 0.025)
        .padding(.bottom, geometry.size.height*0.05)
    }
}
