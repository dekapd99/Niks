//
//  BubblePopupComponent.swift
//  Niks
//
//  Created by Deka Primatio on 04/05/23.
//

import SwiftUI

struct BubblePopupComponent: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Triangle()
                .position(x: 100, y: 100)
                .frame(width: 20, height: 10)
                .rotationEffect(.degrees(360), anchor: .topTrailing)
            
            RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                .frame(width: 321, height: 112)
                .foregroundColor(Color("LightPink"))
            
            Text("Reduces stress, anxiety, depression \nand fatigue. Calms the mind and \nsoothes the nerves. Relieves \ntension in the neck and back.")
                .multilineTextAlignment(.leading)
                .popupTextStyle()
                
        }
    }//: - BODY
}

//MAKR: - PREVIEW
struct BubblePopupComponent_Previews: PreviewProvider {
    static var previews: some View {
        BubblePopupComponent()
            .padding()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
