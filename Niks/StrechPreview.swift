//
//  StrechPreview.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 02/05/23.
//

import SwiftUI

struct StrechPreview: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AnimationViewModel
    @State var curIndex: Int = 0
    @State var stretchView: Bool = false
    @Binding var previewStretch: Bool
    //MARK: - BODY
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                
                ExitButtonView(geometry: geometry)
                
                InfoButtonView(geometry: geometry)
                
                TitleView(geometry: geometry,
                          currentindex: $curIndex)
                
                DescriptionView(geometry: geometry,
                                prompt: getCurrentDialog())
                
//                ModelAnimationView(geometry: geometry,
//                                   viewModel: viewModel)
                
                if curIndex > 0 {
                    ProgressBarView(geometry: geometry,
                                    curIndex: $curIndex)
                }
                
                ButtonComponentText(text: getButtonText(),
                                    rounded: false,
                                    colorgrad: Constant.ColorStyle.Purple,
                                    doThis: {
                    if curIndex > 0 {stretchView = true}
                    else {curIndex += 1}
                })
                .position(x: geometry.size.width / 2 ,
                          y: geometry.size.height * 0.84)
                
                if stretchView && curIndex > 0 {
                    StretchingView(curIndex: $curIndex,
                                   stretchView: $stretchView)
                }
            }
            .ignoresSafeArea()
            .background(Color("LightBlue"))
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
        }
    }
    func getCurrentDialog() -> String {
        return Dialogue.strech.Prompts[curIndex]
    }
    func getButtonText() -> String {
        return curIndex < 1 ? "Continue" : "Start"
    }
}

struct ExitButtonView: View {
    var geometry: GeometryProxy
    var body: some View {
        HStack{
            Image(systemName: "xmark.circle")
                .iconStyle()
        }.position(x: geometry.size.width * 0.05,
                   y: geometry.size.height * 0.08)
    }
}

struct InfoButtonView: View {
    var geometry: GeometryProxy
    var body: some View {
        HStack{
            Image(systemName: "questionmark.circle")
                .iconStyle()
        }.position(x: geometry.size.width * 0.95,
                   y: geometry.size.height * 0.08)
    }
}

struct TitleView: View {
    var geometry: GeometryProxy
    @Binding var currentindex: Int
    var body: some View {
        VStack{
            Text(Dialogue.strech.Titles[currentindex])
                .titleStyle()
            Text(Dialogue.strech.SubTitles[currentindex])
                .titleStyle()
                .padding(.top, -40)
        }
        .position(x: geometry.size.width / 2 ,
                  y: geometry.size.height * 0.1)
    }
}

struct ProgressBarView: View {
    var geometry: GeometryProxy
    @Binding var curIndex: Int
    var body: some View {
        ProgressBarComponent(currentSteps: $curIndex)
            .position(x: geometry.size.width / 2,
                      y: geometry.size.height * 0.97)
    }
}

struct ModelAnimationView: View {
    var geometry: GeometryProxy
    @ObservedObject var viewModel: AnimationViewModel
    var body: some View {
        HStack{
            TimelineView(.periodic(from: .now, by: 0.1)){
                timeline in
                animationView()
                    .environmentObject(viewModel)
                    .frame(width: geometry.size.width * 0.35,
                           height: geometry.size.width * 0.35)
            }
        }
        .position(x: geometry.size.width * 0.5 ,
                  y: geometry.size.height * 0.35)
    }
}

struct DescriptionView: View {
    var geometry: GeometryProxy
    var prompt: String
    var body: some View {
        Text(prompt)
            .descriptionStyle()
            .frame(width: geometry.size.width * 0.7)
            .position(x: geometry.size.width/2,
                      y: geometry.size.height * 0.65)
    }
}

struct StrechPreview_Previews: PreviewProvider {
    static var previews: some View {
        StrechPreview(curIndex: 0, previewStretch: .constant(true))
            .environmentObject(AnimationViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}





