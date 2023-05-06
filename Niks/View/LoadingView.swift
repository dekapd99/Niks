//
//  LoadingView.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct LoadingView: View {
    //MARK: - PROPERTIES
    @State private var rotationAngle: Double = 0
    
    //MARK: - BODY
    var body: some View {
        
        ZStack {
            Color("LightBlue")
            
            VStack(spacing: 124) {
                LoadingComponent()
                    .rotationEffect(Angle(degrees: rotationAngle))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                            self.rotationAngle = 360
                        }
                    }
                
                Text("Tips: Let’s make a habit out of this to make you sleep easier!")
                    .descriptionStyle()
            }//: - VSTACK LOADING & TIPS
        }//: - ZSTACK COLOR
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                // Navigate to another page here
            }
        }
    }//: - BODY
}

//MARK: - PREVIEW
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
