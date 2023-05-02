//
//  ButtonStyle.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

//MARK: - CUSTOM BUTTON MODIFIER
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 209, height: 67)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(Color("Purple"))
            )
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonModifier())
    }
}

struct ButtonStyle: View {
    var body: some View {
        VStack {
            Button {
                print("tapped")
            } label: {
                Text("Start")
                    .buttonStyle()
            }
        }
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle()
    }
}
