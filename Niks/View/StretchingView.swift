//
//  StretchingView.swift
//  Niks
//
//  Created by Abner Edgar on 02/05/23.
//

import SwiftUI

struct StretchingView: View {
    //MARK: - PROPERTIES
    @Binding var previewStretch: Bool
    @ObservedObject var viewModel: AnimatorViewModel
    //MARK: - BODY
    var body: some View {
        //MARK: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
        GeometryReader { geometry in
            //MARK: - ZSTACK (BACKGROUND & OBJECTS)
            ZStack{
                Image(Constant.BackgroundImage.BackgroundStretch)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                DimmerView()
                VStack {
                    StretchTitleView(geometry: geometry,
                                     viewModel: viewModel)
                    StretchTimerView(geometry: geometry,
                                     viewModel: viewModel)
                    Spacer()
                    StretchPauseView(geometry: geometry,
                                     viewModel: viewModel)
                }
                BubbleDialogueComponent(text: Dialogue.Stretching.Prompt[viewModel.curIndex > 0 ? viewModel.curIndex-1 : 0])
                    .position(x: geometry.size.width / 2,
                              y: geometry.size.height * 0.12)
                ExitButtonView(geometry: geometry,
                               previewStretch: $previewStretch)
                ModelAnimationView(geometry: geometry,
                                   viewModel: viewModel)
            }//: - ZSTACK (BACKGROUND & OBJECTS)
            .onAppear{
                AudioPlayer.shared.playpause()
            }
            .ignoresSafeArea()
            .position(x: geometry.size.width/2,
                      y: geometry.size.height/2)
        }//: - GEOMETRY READER (RESPONSIVE OBJECT PLACEMENT)
    }//: - BODY
    
}

struct StretchTitleView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    @ObservedObject var viewModel: AnimatorViewModel
    //MARK: - BODY
    var body: some View {
        HStack { //MARK: - HSTACK (BACKGROUND)
            Spacer()
            Image("StretchTitle")
                .resizable()
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.15)
                .overlay{
                    Text(Dialogue.Stretching.Title[viewModel.curIndex > 0 ? viewModel.curIndex-1 : 0])
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
    @ObservedObject var viewModel: AnimatorViewModel
    //MARK: - BODY
    var body: some View {
        HStack { //MARK: - HSTACK (BACKGROUND)
            Spacer()
            TimerComponent(
                timer: 60,
                colorgrad: Constant.ColorStyle.Purple,
                diameter: geometry.size.width * 0.1,
                wideness: geometry.size.width * 0.015,
                viewModel: viewModel
            )
            .padding(.trailing, geometry.size.width * 0.025)
        }
    }//: - BODY
}

struct StretchPauseView: View {
    //MARK: - PROPERTIES
    var geometry: GeometryProxy
    @ObservedObject var viewModel: AnimatorViewModel
    //MARK: - BODY
    var body: some View {
        HStack{ //MARK: - HSTACK (BACKGROUND)
            Spacer()
            ButtonComponent(
                image: viewModel.isActive ? Constant.IconStyle.Pause : Constant.IconStyle.Play,
                rounded: true,
                colorgrad: Constant.ColorStyle.DarkPurple,
                doThis: {
                    viewModel.isActive.toggle()
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

//struct StretchingView_Previews: PreviewProvider {
//    //MARK: - PROPERTIES
//    //MARK: - BODY
//    static var previews: some View {
//        StretchingView(curIndex: .constant(0),
//                       stretchView: .constant(false),
//                       previewStretch: .constant(true))
//            .previewInterfaceOrientation(.landscapeLeft)
//            .previewLayout(.sizeThatFits)
//    }//: - BODY
//}
