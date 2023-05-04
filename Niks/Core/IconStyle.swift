//
//  IconStyle.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

//MARK: - CUSTOM ICON MODIFIER
struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 56, weight: .medium))
            .foregroundColor(Color("SoftBlack"))
            .padding()
            .ignoresSafeArea()
    }
}

extension View {
    func iconStyle() -> some View {
        modifier(IconModifier())
    }
}

struct IconStyle: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark.circle")
                .iconStyle()
            
            Image(systemName: "questionmark.circle")
                .iconStyle()
            
            Image(systemName: "speaker.wave.2")
                .iconStyle()
            
            Image(systemName: "play.fill")
                .iconStyle()
            
            Image(systemName: "pause.fill")
                .iconStyle()
        }
    }
}

struct IconStyle_Previews: PreviewProvider {
    static var previews: some View {
        IconStyle()
    }
}
