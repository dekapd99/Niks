//
//  ProgressBarComponent.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 02/05/23.
//

import SwiftUI

struct ProgressBarComponent: View {
    let totalSteps: Int = 7
    @ObservedObject var viewModel: AnimatorViewModel
    var currentSteps: Int {
        return viewModel.curIndex
    }
    var body: some View {
        ZStack(alignment: .leading){
                HStack(spacing: 0){
                    ForEach(0..<7){ index in
                        Rectangle()
                            .foregroundColor(index < currentSteps ? Constant.ColorStyle.Purple : .gray)
                            .frame(width: UIScreen.main.bounds.width * 0.73 / CGFloat(totalSteps),
                                   height: UIScreen.main.bounds.height * 0.01)
                            .animation(.easeIn, value: currentSteps)
                    }
                }
            HStack{
                ForEach(0..<7) { index in
                    Spacer()
                    Circle()
                        .foregroundColor(index < currentSteps ? Constant.ColorStyle.Purple : .gray)
                        .frame(width: UIScreen.main.bounds.width * 0.04,
                               height: UIScreen.main.bounds.height * 0.04)
                        .onTapGesture{
                            viewModel.curIndex = index + 1
                        }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.75,
                   height: 12)
        }
    }
}

//struct ProgressBarComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarComponent()
//    }
//}
