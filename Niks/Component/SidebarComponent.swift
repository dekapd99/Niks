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
    var colorPrimary: Color {return colorgrad.opacity(0.8)}
    var colorSecondary: Color {return colorgrad}
    var pos: CGPoint {
        return CGPoint(x: getWidth()-getWidth()/2, y: bounds.y-bounds.y/2)
    }
    var barExpandWidth: CGFloat{
        return bounds.x * 0.30
    }
    @State var opacView: CGFloat = 0
    var body: some View {
        VStack(alignment: .leading) {
            SidebarContentView(colorgrad: colorgrad)
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
    func getLeftPadding() -> CGFloat{
        return getWidth() == 0 ? 0 : leftIndent
    }
    func getBound(screenSize: CGSize) -> CGPoint{
        return CGPoint(x: screenSize.width,
                       y: screenSize.height)
    }
}

struct SidebarContentView: View {
    @State var activeMusic: Int = 0
    let spacing: CGFloat = 10
    let colorgrad: Color
    var musicCrate: [MusicModel] = [
        MusicModel(name: "City", image: "CityImage"),
        MusicModel(name: "Rain", image: "RainImage"),
        MusicModel(name: "Beach", image: "BeachImage"),
        MusicModel(name: "W. Noise", image: "WNoiseImage")
    ]
    var body: some View{
        VStack{
            HStack(alignment: .center) {
                Text("Sound")
                    .font(
                        .system(size: 30)
                        .weight(.bold))
                    .frame(width: 100, height: 30)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.bottom,30)
            ForEach(musicCrate) { music in
                HStack{}
                    .padding(.bottom,spacing)
                ItemView(isActive: isActive(music),
                         music: music)
                .onTapGesture {
                    activeMusic = getIndex(music)
                }
            }
        }
        .padding(.trailing,30)
        
    }
    func getIndex(_ music: MusicModel) -> Int {
        return musicCrate.firstIndex(where: {$0.name == music.name})!
    }
    func isActive(_ music: MusicModel) -> Bool {
        return musicCrate[activeMusic].name == music.getName()
    }
}

struct ItemView: View {
    let isActive: Bool
    let radius: CGFloat = 25
    let music: MusicModel
    var body: some View{
        HStack(alignment: .center) {
            Image(music.image)
                .resizable()
                .background(.white.opacity(0.8))
                .frame(width: radius*2, height: radius*2)
                .cornerRadius(radius)
                .padding(.trailing,5)
            Text(music.name)
                .frame(width: radius*4.2, height: radius, alignment: .leading)
                .foregroundColor(.black)
                Spacer()
            if isActive {
                Image(systemName: Constant.IconStyle.Speaker)
                    .resizable()
                    .frame(width: radius, height: radius-5)
                    .iconStyle()
            }
        }
        .frame(width: 300, height: 70)
        .padding(.horizontal, 20)
        .background(isActive ? .gray.opacity(0.8) : .clear)
        .cornerRadius(15)
        .shadow(color: .white.opacity(0.5),
                radius: isActive ? 8 : 0)
    }
}

struct SidebarComponent_Previews: PreviewProvider {
    @State var toggle: Bool = false
    static var previews: some View {
        GeometryReader { geometry in
            SidebarComponent(toggle: .constant(true),
                             bounds: CGPoint(
                                x: geometry.size.width,
                                y: geometry.size.height),
                             colorgrad: .white)
        }
        .previewInterfaceOrientation(.landscapeLeft)
        .background(.black)
    }
}


