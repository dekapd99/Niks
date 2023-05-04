//
//  StretchingView.swift
//  Niks
//
//  Created by Abner Edgar on 02/05/23.
//

import SwiftUI

struct StretchingView: View {
    //MARK: - PROPERTIES
    @State var toggle: Bool = true
    //MARK: - BODY
    var body: some View {
        //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        GeometryReader { geometry in
            //MARK: - ZSTACK (BACKGROUND & OBJECTS)
            ZStack{
                Image(Constant.BackgroundImage.BackgroundStretch)
                DimmerView()
                VStack {
                    StretchTitleView(geometry: geometry)
                    StretchTimerView(geometry: geometry, toggle: $toggle)
                    Spacer()
                    StretchPauseView(geometry: geometry, toggle: $toggle)
                }
                BubbleDialogueComponent(text: Dialogue.Stretching.Prompt[0])
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 0.12)
            }//: - ZSTACK (BACKGROUND & OBJECTS)
            .ignoresSafeArea()
            .position(x: geometry.size.width/2,
                      y: geometry.size.height/2)
        }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
    }//: - BODY
}

struct StretchTitleView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    //MARK: - BODY
    var body: some View {
        HStack { //MARK: - HSTACK (BACKGROUND)
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
    }//: - BODY
}

struct StretchTimerView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    @Binding var toggle: Bool
    //MARK: - BODY
    var body: some View {
        HStack { //MARK: - HSTACK (BACKGROUND)
            Spacer()
            TimerComponent(
                timer: 60,
                colorgrad: Constant.ColorStyle.Purple,
                diameter: geometry.size.width * 0.1,
                wideness: geometry.size.width * 0.015,
                isActive: $toggle)
                .padding(.trailing, geometry.size.width * 0.025)
        }
    }//: - BODY
}

struct StretchPauseView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    @Binding var toggle: Bool
    //MARK: - BODY
    var body: some View {
        HStack{ //MARK: - HSTACK (BACKGROUND)
            Spacer()
            ButtonComponent(
                image: toggle ? Constant.IconStyle.Pause : Constant.IconStyle.Play,
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

struct DimmerView: View {
    //MARK: - PROPERTIES
    let dimVal: CGFloat = 0.2
    //MARK: - BODY
    var body: some View {
        VStack{ //MARK: - VSTACK (BACKGROUND)
            Spacer()
            HStack{ //MARK: - HSTACK (BACKGROUND)
                Spacer()
            }
        }
        .background(Constant.ColorStyle.SoftBlack.opacity(dimVal))
    }//: - BODY
}

struct StretchingView_Previews: PreviewProvider {
    //MARK: - PROPERTIES
    //MARK: - BODY
    static var previews: some View {
        StretchingView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }//: - BODY
}
