//
//  ProgressComponent.swift
//  Niks
//
//  Created by Deka Primatio on 04/06/23.
//

import SwiftUI

struct ProgressComponent: View {
    //MARK: - PROPERTIES
    let totalSteps: Int = 7
    @ObservedObject var viewModel: AnimatorViewModel
    
    var currentSteps: Int {
        return viewModel.curIndex
    }
    
    var body: some View {
        ZStack() {
            HStack(spacing: 0){
                ForEach(0..<7){ index in
                    Rectangle()
                        .foregroundColor(index < currentSteps ? Constant.ColorStyle.Purple : .gray)
                        .frame(width: UIScreen.main.bounds.width * 0.72 / CGFloat(totalSteps),
                               height: UIScreen.main.bounds.height * 0.01)
                        .animation(.easeIn, value: currentSteps)
                }
            }
            
            HStack{
                ForEach(0..<7) { index in
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(index < currentSteps ? Constant.ColorStyle.Purple : .gray)
                            .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.04)
                        Text("\(index + 1)")
                            .foregroundColor(Color("SoftWhite"))
                            .tutorialNumberStyle()
                    }
                    .onTapGesture{
                        viewModel.curIndex = index + 1
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.75,
                   height: 12)
            
            VStack {
                Text("Tap one of the Numbers to Navigate")
                    .foregroundColor(Color("SoftBlack"))
                    .shimmer(.init(tint: .white.opacity(0.1), highlight: .white.opacity(0.6), blur: 5))
                    .popupTextStyle()
                    .padding(.top, 70)
            }
        }
    }
}

