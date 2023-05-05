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
    @Binding var curIndex: Int
    @Binding var stretchView: Bool
    //MARK: - BODY
    var body: some View {
        //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        GeometryReader { geometry in
            //MARK: - ZSTACK (BACKGROUND & OBJECTS)
            ZStack{
                
                Image(Constant.BackgroundImage.BackgroundStretch)
                    .resizable()
                DimmerView()
                VStack {
                    StretchTitleView(geometry: geometry,
                                     curIndex: $curIndex)
                    StretchTimerView(geometry: geometry,
                                     isFinish: {
                                            incrementCurIndex()
                                            stretchView = false},
                                     toggle: $toggle)
                    Spacer()
                    StretchPauseView(geometry: geometry,
                                     toggle: $toggle)
                    Text("\(String(curIndex))")
                }
                BubbleDialogueComponent(text: Dialogue.Stretching.Prompt[curIndex > 0 ? curIndex-1 : 0])
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 0.12)
                
            }//: - ZSTACK (BACKGROUND & OBJECTS)
            .ignoresSafeArea()
            .position(x: geometry.size.width/2,
                      y: geometry.size.height/2)
        }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
    }//: - BODY
    func incrementCurIndex() -> () {
        guard curIndex < Dialogue.strech.SubTitles.count-1 else { return }
        curIndex += 1
    }
}

struct StretchTitleView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    @Binding var curIndex: Int
    //MARK: - BODY
    var body: some View {
        HStack { //MARK: - HSTACK (BACKGROUND)
            Spacer()
            Image("StretchTitle")
                .resizable()
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.15)
                .overlay{
                    Text(Dialogue.Stretching.Title[curIndex > 0 ? curIndex-1 : 0])
                        .titleStyle()
                        .frame(width: geometry.size.width * 0.22,
                               height: geometry.size.height * 0.15)
                }
        }
        .padding(.bottom, geometry.size.height * 0.05)
    }//: - BODY
}

struct StretchTimerView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    let isFinish: () -> ()
    @Binding var toggle: Bool
    //MARK: - BODY
    var body: some View {
        HStack { //MARK: - HSTACK (BACKGROUND)
            Spacer()
            TimerComponent(
                timer: 5,
                colorgrad: Constant.ColorStyle.Purple,
                diameter: geometry.size.width * 0.1,
                wideness: geometry.size.width * 0.015,
                isFinish: isFinish,
                isActive: $toggle
            )
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
        StretchingView(curIndex: .constant(0),
                       stretchView: .constant(false))
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }//: - BODY
}
