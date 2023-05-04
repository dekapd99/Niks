//
//  BubbleDialogueComponent.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct BubbleDialogueComponent: View {
    //MARK: - PROPERTIES
    @State var text: String
    //MARK: - BODY
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("BubbleTriangle")
                    .position(x: geometry.size.width / 1.6, y: geometry.size.height / 1.66)
            }
            RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                .frame(width: 660, height: 152)
                .foregroundColor(Color("LightPink"))
            
            Text("\(text)")
                .titleStyle()
                .frame(width: 450, height: 150)
        }
            
    }//: - BODY
}

//MARK: - PREVIEW
struct BubbleDialogueComponent_Previews: PreviewProvider {
    static var previews: some View {
        BubbleDialogueComponent(text: "1")
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
