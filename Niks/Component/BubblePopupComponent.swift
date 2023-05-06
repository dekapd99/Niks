//
//  BubblePopupComponent.swift
//  Niks
//
//  Created by Deka Primatio on 04/05/23.
//

import SwiftUI

struct BubblePopupComponent: View {
    //MARK: - PROPERTIES
    let text: String
    //MARK: - BODY
    var body: some View {
        VStack{
            HStack{
                Spacer()
                ZStack {
                    Image(systemName: "arrowtriangle.up.fill")
                        .position(x: 145, y: -58)
                        .foregroundColor(Color("LightPink"))
                        .frame(width: 20, height: 10)
                    
                    RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                        .frame(width: 321, height: 112)
                        .foregroundColor(Color("LightPink"))
                        .listRowSeparator(.hidden)
                    
                    Text(text)
                        .frame(width: 321, height: 112)
                        .popupTextStyle()
                }
            }
            .padding(.trailing,27)
            Spacer()
        }
        .padding(.top, 108)
    }//: - BODY
}

//MAKR: - PREVIEW
struct BubblePopupComponent_Previews: PreviewProvider {
    static var previews: some View {
        BubblePopupComponent(text: "")
            .padding()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
