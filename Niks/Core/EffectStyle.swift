//
//  EffectStyle.swift
//  Niks
//
//  Created by Deka Primatio on 02/05/23.
//

import SwiftUI

//MARK: - EXTENSION SPOTLIGHT TUTORIAL WITH VIEWBUILDER
extension View {
    @ViewBuilder
    
    //MARK: - by using ANCHOR PREFERENCE FOR RETREIVING VIEW'S BOUNDS REGION
    func addSpotlight(_ id: Int, shape: SpotlightShape = .rectangle, roundedRadius: CGFloat = 0, text: String = "") -> some View {
        self
            .anchorPreference(key: BoundsKey.self, value: .bounds) {[id: BoundsKeyProperties(shape: shape, anchor: $0, text: text, radius: roundedRadius)]}
    }
    
    //MARK: - MODIFIER TO DISPLAY SPOTLIGHT THAT OVERLAY THE CONTENT (ADD TO ROOT VIEW)
    @ViewBuilder
    func addSpotlightOverlay(show: Binding<Bool>, currentSpot: Binding<Int>) -> some View {
        self
            .overlayPreferenceValue(BoundsKey.self) { values in
                GeometryReader { proxy in
                    if let preference = values.first(where: { item in
                        item.key == currentSpot.wrappedValue
                    }) {
                        let screenSize = proxy.size
                        let anchor = proxy[preference.value.anchor]
                        
                        //MARK: - Call Spotlight View
                        SpotlightHelperView(screenSize: screenSize, rect: anchor, show: show, currentSpot: currentSpot, properties: preference.value) {
                            
                            if currentSpot.wrappedValue <= (values.count) {
                                currentSpot.wrappedValue += 1
                            } else {
                                show.wrappedValue = false
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                .animation(.easeInOut, value: show.wrappedValue)
                .animation(.easeInOut, value: currentSpot.wrappedValue)
            }
    }
    //MARK: - SPOTLIGHT HELPER VIEW
    @ViewBuilder
    func SpotlightHelperView(screenSize: CGSize, rect: CGRect, show: Binding<Bool>, currentSpot: Binding<Int>, properties: BoundsKeyProperties, onTap: @escaping() -> ()) -> some View {
        Rectangle()
            .fill(Color("SoftBlack"))
            .opacity(show.wrappedValue ? 0.8 : 0)
        
            //MARK: - SPOTLIGHT TEXT DESCRIPTION
            .overlay(alignment: .topLeading) {
                Text(properties.text)
                    .titleStyle()
                
                //MARK: - EXTRACTING TEXT SIZE
                    .opacity(0)
                    .overlay {
                        GeometryReader { proxy in
                            let textSize = proxy.size
                            
                            Text(properties.text)
                                .titleStyle()
                            //MARK: - DYNAMIC TEXT ALIGNMENT
                            // HORIZONTAL CHECKING
                                .offset(x: (rect.minX + textSize.width) > (screenSize.width - 15) ? -((rect.minX + textSize.width) - (screenSize.width - 15) ) : 0)
                            // VERTICAL CHECKING
                                .offset(y: (rect.maxY + textSize.height) > (screenSize.height - 50) ? -(textSize.height - (rect.maxY - rect.minY) + 30) : 0)
                        }
                        .offset(x: rect.minX, y: rect.maxY)
                    }
            }
        
            //MARK: - REVERSE MASKING THE CURRENT SPOTLIGHT CONTENT
            //The Currently Spotlighted View will be Looking like Highlighted
            .mask {
                Rectangle()
                    .overlay(alignment: .topLeading) {
                        let radius = properties.shape == .circle ? (rect.width / 2) : (properties.shape == .rectangle ? 0 : properties.radius)
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .frame(width: rect.width, height: rect.height)
                            .offset(x: rect.minX, y: rect.minY)
                            .blendMode(.destinationOut)
                    }
            }
            .onTapGesture {
                //MARK: - UPDATING SPOTLIGHT TO THE NEXT SPOTLIGHT CONTENT
                // If Available
                onTap()
            }
        
    }
}

//MARK: - SPOTLIGHT SHAPE
enum SpotlightShape {
    case circle
    case rectangle
    case rounded
}

//MARK: - BOUND PREFERENCE KEY
struct BoundsKey: PreferenceKey {
    static var defaultValue: [Int: BoundsKeyProperties] = [:]
    
    static func reduce(value: inout [Int : BoundsKeyProperties], nextValue: () -> [Int : BoundsKeyProperties]) {
        value.merge(nextValue()){$1}
    }
}

//MARK: - BOUND PREFERENCE KEY PROPERTIES
struct BoundsKeyProperties {
    var shape: SpotlightShape
    var anchor: Anchor<CGRect>
    var text: String = ""
    var radius: CGFloat = 0
}


//MARK: - PULSING ANIMATION CONTENT MODIFIER
struct PulsingAnimationModifier: ViewModifier {
    @State private var isPulsing = false
    
    let repeatForever: Bool
    let autoreverses: Bool
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPulsing ? 0.8 : 1.0)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.0 ).repeatForever(autoreverses: autoreverses)) {
                    isPulsing.toggle()
                }
            }
    }
}

//MARK: - EXTENSION FOR PULSING ANIMATION
extension View {
    func pulsingAnimation(repeatForever: Bool = true, autoreverses: Bool = true) -> some View {
        return self.modifier(PulsingAnimationModifier(repeatForever: repeatForever, autoreverses: autoreverses))
    }
}

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
