//
//  SleepView.swift
//  Niks
//
//  Created by Deka Primatio on 05/05/23.
//

import SwiftUI

struct SleepView: View {
    //MARK: - PROPERTIES
    @State private var textIndex = 0
    @State private var showBubble = true
    @State private var isPresentingTotallySleepView = false
    
    private let texts = [
        "*Yawn* \nNow it’s time to sleep~",
        "You can leave Niks open and have the \nbackground music accompany you to sleep.",
        "Let’s set a reminder for your \nsession tomorrow~"
    ]
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image(Constant.BackgroundImage.BackgroundSleep)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                if showBubble {
                    BubbleDialogueComponent(text: texts[textIndex])
                        .transition(.scale)
                        .animation(.easeInOut(duration: 0.5))
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 6.5)
                        .opacity(textIndex < texts.count ? 1 : 0)
                }
                
                Image("Character")
                    .resizable()
                    .frame(width: 167, height: 552)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
                Text("Tap to Continue")
                    .foregroundColor(Color("SoftWhite"))
                    .pulsingAnimation()
                    .titleStyle()
                    .position(x: geometry.size.width / 2, y: geometry.size.height - 70)
            }
        }//: - ZSTACK WRAPPER
        .onTapGesture {
            if textIndex == texts.count - 1 {
                isPresentingTotallySleepView = true
            } else {
                textIndex = (textIndex + 1) % texts.count
            }
        }
        .fullScreenCover(isPresented: $isPresentingTotallySleepView) {
            TotallySleepView()
                .background(Color.clear)
        }
    }//: - BODY
}

//MARK: - PREVIEW
struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
