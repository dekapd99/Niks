//
//  EffectStyle.swift
//  Niks
//
//  Created by Deka Primatio on 02/05/23.
//

import SwiftUI

//MARK: - EXTENSION FOR SHIMMER WITH @VIEWBUILDER
extension View {
    @ViewBuilder
    
    func shimmer(_ config: ShimmerConfig) -> some View {
        self
            .modifier(ShimmerEffect(config: config))
    }
}

//MARK: - SHIMMER EFFECT CONTENT MODIFIER
fileprivate struct ShimmerEffect: ViewModifier {
    var config: ShimmerConfig //Shimmer Config (Data Type)
    @State private var moveTo: CGFloat = -0.7 //Move to Property
    
    func body(content: Content) -> some View {
        content
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask{
                        content
                    }
                    .overlay {
                        // Shimmer
                        GeometryReader {
                            let size = $0.size
                            
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                    Rectangle()
                                    //Gradient Glowing
                                        .fill(
                                            .linearGradient(colors: [.white.opacity(0), config.highlight.opacity(config.highlightOpacity)], startPoint: .top, endPoint: .bottom)
                                        )
                                    //Adding Blur Modifier
                                        .blur(radius: config.blur)
                                    //Rotating Degree
                                        .rotationEffect(.init(degrees: -70))
                                    //Moving from Start
                                        .offset(x: size.width * moveTo)
                                }
                        }
                        //Mask with the Content
                        .mask {
                            content
                        }
                    }
                    //Dispatch Queue with DispatchQueue to Avoid Animation Glitch
                    .onAppear{
                        DispatchQueue.main.async {
                            moveTo = 0.7
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}

//Shimmer Animation Data Type
struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat = 0
    var highlightOpacity: CGFloat = 1
    var speed: CGFloat = 2
}

//MARK: - BACKGROUND EXAMPLE PREVIEW
struct EffectStyle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundExampleView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
