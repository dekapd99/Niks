//
//  StrechPreview.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 02/05/23.
//

import SwiftUI


struct StrechPreview: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: AnimatorViewModel
    @Binding var previewStretch: Bool
    
    //MARK: - BODY
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                
                ExitButtonView(geometry: geometry,
                               previewStretch: $previewStretch)
                
                InfoButtonView(geometry: geometry)
                
                TitleView(geometry: geometry,
                          viewModel: viewModel)
                
                DescriptionView(geometry: geometry,
                                prompt: getCurrentDialog())
                
                if !viewModel.stretchView{
                    ModelAnimationView(geometry: geometry,
                                       viewModel: viewModel)
                }

                if viewModel.curIndex > 0 {
                    ProgressBarView(geometry: geometry,
                                    viewModel: viewModel)
                }
                
                ButtonComponentText(text: getButtonText(),
                                    rounded: false,
                                    colorgrad: Constant.ColorStyle.Purple,
                                    doThis: {
                    if viewModel.curIndex > 0 {viewModel.stretchView = true}
                    else {viewModel.curIndex += 1}
                })
                .position(x: geometry.size.width / 2 ,
                          y: geometry.size.height * 0.84)
                
                if viewModel.stretchView && viewModel.curIndex > 0 {
                    StretchingView(previewStretch: $previewStretch,
                                   viewModel: viewModel)
                    .onAppear{
                        viewModel.changed = false
                    }
                }
            }
            .onAppear{
                AudioPlayer.shared.playpause()
            }
            .ignoresSafeArea()
            .background(Color("LightBlue"))
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
        }
    }
    func getCurrentDialog() -> String {
        return Dialogue.strech.Prompts[viewModel.curIndex]
    }
    func getButtonText() -> String {
        return viewModel.curIndex < 1 ? "Continue" : "Start"
    }
}

struct ExitButtonView: View {
    var geometry: GeometryProxy
    @Binding var previewStretch: Bool
    var body: some View {
        HStack{
            Image(systemName: "xmark.circle")
                .iconStyle()
        }
        .position(x: geometry.size.width * 0.05,
                  y: geometry.size.height * 0.085)
        .onTapGesture {
            previewStretch = false
        }
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
    @ObservedObject var viewModel: AnimatorViewModel
    var body: some View {
        VStack{
            Text(Dialogue.strech.Titles[viewModel.curIndex])
                .titleStyle()
            Text(Dialogue.strech.SubTitles[viewModel.curIndex])
                .titleStyle()
                .padding(.top, -40)
        }
        .position(x: geometry.size.width / 2 ,
                  y: geometry.size.height * 0.1)
    }
}

struct ProgressBarView: View {
    var geometry: GeometryProxy
    @ObservedObject var viewModel: AnimatorViewModel
    var body: some View {
        ProgressBarComponent(viewModel: viewModel)
            .position(x: geometry.size.width / 2,
                      y: geometry.size.height * 0.97)
    }
}

struct ModelAnimationView: View {
    var geometry: GeometryProxy
    @ObservedObject var viewModel: AnimatorViewModel
    var body: some View {
        HStack{
            Image(viewModel.data[viewModel.curIndex].animationImageNames[viewModel.frame > viewModel.data[viewModel.curIndex].animationImageNames.count-1 ? 0 : viewModel.frame])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: geometry.size.width * (!viewModel.stretchView ? 0.35 : 0.6),
                       height: geometry.size.width * (!viewModel.stretchView ? 0.35 : 0.6))
        }
        .position(x: geometry.size.width * (!viewModel.stretchView ? 0.5 : viewModel.modelPos[viewModel.curIndex].x),
                  y: geometry.size.height * (!viewModel.stretchView ? 0.35 : viewModel.modelPos[viewModel.curIndex].y))
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

//struct StrechPreview_Previews: PreviewProvider {
//    @ObservedObject var viewModel: AnimatorViewModel
//    static var previews: some View {
//        StrechPreview(viewModel: viewModel, curIndex: 0, previewStretch: .constant(true))
//            .previewInterfaceOrientation(.landscapeLeft)
//            .previewLayout(.sizeThatFits)
//    }
//}





