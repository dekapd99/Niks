//
//  SplashScreenView.swift
//  Niks
//
//  Created by Deka Primatio on 05/05/23.
//

import SwiftUI

struct SplashScreenView: View {
    //MARK: - PREVIEW
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    //MARK: - BODY
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color("Pink")
                
                ZStack {
                    Image("NiksShape")
                        .resizable()
                        .scaledToFit()
                    
                    Image("NiksOrnament")
                        .resizable()
                        .scaledToFit()
                    
                    Image("NiksFont")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }

            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
        
    }//: - BODY
}

//MARK: - PREVIEW
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
