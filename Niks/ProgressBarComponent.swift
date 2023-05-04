//
//  ProgressBarComponent.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 02/05/23.
//

import SwiftUI

struct ProgressBarComponent: View {
    let totalSteps: Int = 7
    let checkPoint: [Int] = [0,1,2,3,4,5,6]
    @State private var currentSteps: Int = 0
    @State private var isShowingDetail: Bool = false
    @State private var selectedCheckpoint: Int?
    var body: some View {
//        NavigationView{a
            VStack(alignment: .leading, spacing: 8){
                ZStack(alignment: .leading){
                    
                    HStack(spacing: 0){
                        ForEach(0..<totalSteps){ index in
                            Rectangle()
                                .foregroundColor(index <= currentSteps ? Constant.ColorStyle.Purple : .gray)
                                .frame(width: UIScreen.main.bounds.width * 0.75 / CGFloat(totalSteps), height: UIScreen.main.bounds.height * 0.01)
                                .animation(.easeIn, value: currentSteps)
                        }
                    }
                    HStack(spacing: 0){
                        
                        ForEach(0..<totalSteps) { index in
                            if checkPoint.contains(index){
                                Spacer()
                                Circle()
                                    .foregroundColor(index <= currentSteps ? Constant.ColorStyle.Purple : .gray)
                                    .frame(width: UIScreen.main.bounds.width * 0.04 , height: UIScreen.main.bounds.width * 0.04)
                                    .zIndex(1)
                                    .onTapGesture{
                                        selectedCheckpoint = index
                                        currentSteps = selectedCheckpoint!
                                    }
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width * 0.75 , height: 12)
                        
                }
            }
//        }.navigationViewStyle(.stack)
    }
}

struct ProgressBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarComponent()
    }
}
