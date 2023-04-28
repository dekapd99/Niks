//
//  SidebarComponent.swift
//  Niks
//
//  Created by Abner Edgar on 27/04/23.
//

import SwiftUI

struct SidebarComponent: View {
    @Binding var toggle: Bool
    let bounds: CGPoint
    let colorgrad: Color
    let animateSpeed: CGFloat = 2
    let springStiffness: CGFloat = 80
    let springDamp: CGFloat = 20
    let opac: CGFloat = 0.8
    let leftIndent: CGFloat = 50
    let verticalIndent: CGFloat = 40
    var colorPrimary: Color {return colorgrad.opacity(0.3)}
    var colorSecondary: Color {return colorgrad}
    var pos: CGPoint {
        return CGPoint(x: getWidth()-getWidth()/2, y: bounds.y-bounds.y/2)
    }
    var barExpandWidth: CGFloat {
        return bounds.x * 0.30
    }
    @State var opacView: CGFloat = 0
    var body: some View {
        VStack(alignment: .leading){
            SidebarContentView(width: getWidth(), colorgrad: colorgrad)
                .padding(.leading, getLeftPadding())
                .frame(width: getWidth(), height: bounds.y)
                .opacity(getOpac())
                .scaleEffect(toggle ? 1 : 0.5, anchor: .leading)
                .position(x: pos.x, y:pos.y-200)
            Spacer()
        }
        .padding(.vertical, verticalIndent)
        .background(colorgrad.opacity(opac))
        .frame(width: getWidth(), height: bounds.y)
        .position(pos)
        .animation(
            .interpolatingSpring(
                stiffness: springStiffness,
                damping: springDamp)
            .speed(animateSpeed),
            value: getWidth())
    }
    func getWidth() -> CGFloat {
        return toggle ? barExpandWidth : 0
    }
    func getOpac() -> CGFloat {
        return toggle ? 1 : 0
    }
    func getLeftPadding() -> CGFloat {
        return getWidth() == 0 ? 0 : leftIndent
    }
    func getBound(screenSize: CGSize) -> CGPoint{
        return CGPoint(x: screenSize.width,
                       y: screenSize.height)
    }
}

struct SidebarContentView: View {
    @State var width: CGFloat
    let radius: CGFloat = 25
    let colorgrad: Color
    @State var index: Int = 1
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text("Sound")
                    .font(
                        .system(size: 30)
                        .weight(.thin))
                    .frame(width: 100, height: 30)
                Spacer()
            }
            HStack{}
                .padding(.bottom,60)
            HStack(alignment: .center){
                Image("")
                    .resizable()
                    .background(.white.opacity(0.8))
                    .frame(width: radius*2, height: radius*2)
                    .cornerRadius(radius)
                    .padding(.trailing,5)
                Text("City")
                    .padding(.trailing,radius*1.5)
                    .frame(width: radius*3, height: radius)
                    Spacer()
                Image(systemName: "speaker.wave.3")
                    .resizable()
                    .frame(width: radius, height: radius-5)
            }
            .overlay{
                if index == 1 {
                    Rectangle()
                        .fill(colorgrad.opacity(0.4))
                        .cornerRadius(20)
                        .frame(width: 280,height: 70)
                }
            }
            .onTapGesture {
                index = 1
            }
            HStack{}
                .padding(.bottom,20)
            HStack(alignment: .center){
                Image("")
                    .resizable()
                    .background(.white.opacity(0.8))
                    .frame(width: radius*2, height: radius*2)
                    .cornerRadius(radius)
                    .padding(.trailing,5)
                Text("Rain")
                    .padding(.trailing,radius*1.5)
                    .frame(width: radius*3, height: radius)
                    Spacer()
                Image(systemName: "")
                    .resizable()
                    .frame(width: radius, height: radius-5)
            }
            .overlay{
                if index == 2 {
                    Rectangle()
                        .fill(colorgrad.opacity(0.4))
                        .cornerRadius(20)
                        .frame(width: 280,
                               height: 70)
                        .animation(.linear, value: index)
                }
            }
            .onTapGesture {
                index = 2
            }
            HStack{}
                .padding(.bottom,20)
            HStack(alignment: .center){
                Image("")
                    .resizable()
                    .background(.white.opacity(0.8))
                    .frame(width: radius*2, height: radius*2)
                    .cornerRadius(radius)
                    .padding(.trailing,5)
                Text("Beach")
                    .padding(.trailing,radius)
                    .frame(width: radius*3, height: radius)
                    Spacer()
                Image(systemName: "")
                    .resizable()
                    .frame(width: radius, height: radius-5)
            }
            .overlay{
                if index == 3 {
                    Rectangle()
                        .fill(colorgrad.opacity(0.4))
                        .cornerRadius(20)
                        .frame(width: 280,
                               height: 70)
                }
            }
            .onTapGesture {
                index = 3
            }
            HStack{}
                .padding(.bottom,20)
            HStack(alignment: .center){
                Image("")
                    .resizable()
                    .background(.white.opacity(0.8))
                    .frame(width: radius*2, height: radius*2)
                    .cornerRadius(radius)
                    .padding(.trailing,5)
                Text("White Noise")
                    .padding(.trailing,radius)
                    .frame(width: radius*3, height: radius)
                    Spacer()
                Image(systemName: "")
                    .resizable()
                    .frame(width: radius, height: radius-5)
            }
            .overlay{
                if index == 4 {
                    Rectangle()
                        .fill(colorgrad.opacity(0.4))
                        .cornerRadius(20)
                        .frame(width: 280,
                               height: 70)
                }
            }
            .onTapGesture {
                index = 4
            }
        }
        .padding(.trailing,30)
    }
}

struct SidebarComponent_Previews: PreviewProvider {
    @State var toggle: Bool = false
    static var previews: some View {
        GeometryReader { geometry in
            SidebarComponent(toggle: .constant(true),
                             bounds: CGPoint(x: UIScreen.main.bounds.width,
                                             y: UIScreen.main.bounds.height),
                             colorgrad: .teal)
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
