//
//  ButtonComponent.swift
//  Niks
//
//  Created by Abner Edgar on 27/04/23.
//

import SwiftUI

struct ButtonComponent: View {
    let image: String
    let rounded: Bool
    let diameter: CGFloat = 100
    let colorgrad: Color
    let animateSpeed: CGFloat = 3
    let springDamp: CGFloat = 8
    let springStiffness: CGFloat = 200
    let scaleActive: CGFloat = 0.9
    let shadowOpac: CGFloat = 0.4
    let doThis: () -> Void
    @State var opac: CGFloat = 0.9
    @State var tap: Bool = false
    var colorPrimary: Color {return colorgrad.opacity(0.3)}
    var colorSecondary: Color {return colorgrad}
    var body: some View {
        RoundedRectangle(cornerRadius: rounded ? 50 : 30)
            .fill(colorgrad)
            .frame(width: diameter,
                   height: diameter)
            .shadow(color: .gray.opacity(shadowOpac),
                    radius: 30,
                    x: 0,
                    y: 0.5)
            .opacity(opac)
            .overlay{
                Image(systemName: image)
                    .resizable()
                    .frame(width: diameter*0.30,
                           height: diameter*0.35)
//                Text("Press me!")
//                    .frame(width: diameter*0.8,
//                           height: diameter*0.8)
//                    .foregroundColor(.white.opacity(0.7))
                
            }
            .scaleEffect(tap ? scaleActive : 1,
                         anchor: .center)
            .animation(
                .interpolatingSpring(
                    stiffness: springStiffness,
                    damping: springDamp)
                .speed(opac*2),
                value: opac)
            .onTapGesture {
                tap = true
                opac = 0.7
                doThis()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    tap = false
                    opac = 1
                }
            }
    }
}

struct CircularButtonComponent: View {
    let position: CGPoint = CGPoint(
        x: UIScreen.main.bounds.size.width-1,
        y: UIScreen.main.bounds.size.height-27)
    let radius: CGFloat = 300
    let centerDeg: CGFloat = 135
    let offsetDeg: CGFloat = 30
    let doButton1: () -> Void
    let doButton2: () -> Void
    let doButton3: () -> Void
    let colorgrad: Color
    
    var body: some View {
        ButtonComponent(image: "",
                        rounded: true,
                        colorgrad: colorgrad,
                        doThis: doButton1)
            .position(getPos(
                degree: centerDeg + offsetDeg,
                radius: radius,
                offset: position))
        ButtonComponent(image: "",
                        rounded: false,
                        colorgrad: colorgrad,
                        doThis: doButton2)
            .position(getPos(
                degree: centerDeg,
                radius: radius,
                offset: position))
        ButtonComponent(image: "",
                        rounded: true,
                        colorgrad: colorgrad,
                        doThis: doButton3)
            .position(getPos(
                degree: centerDeg - offsetDeg,
                radius: radius,
                offset: position))
    }
    func getPos(degree: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        let calcX: CGFloat = radius * cos(degree * .pi/180) + offset.x
        let calcY: CGFloat = (radius * sin(degree * .pi/180) * -1) + offset.y
        return CGPoint(x: calcX, y: calcY)
    }
}


struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            ButtonComponent(image: Constant.IconStyle.Pause,
                            rounded: true,
                            colorgrad: .teal,
                            doThis: {
                //do something
            })
            CircularButtonComponent(doButton1: {},
                                    doButton2: {},
                                    doButton3: {},
                                    colorgrad: .teal)
        }
    }
}
