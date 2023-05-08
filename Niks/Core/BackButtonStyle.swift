//
//  BackButtonStyle.swift
//  Niks
//
//  Created by Deka Primatio on 05/05/23.
//

import SwiftUI

extension View {
    func customBackButton(presentationMode: Binding<PresentationMode>) -> some View {
        self.modifier(CustomBackButtonModifier(presentationMode: presentationMode))
    }
}

struct CustomBackButtonModifier: ViewModifier {
    let presentationMode: Binding<PresentationMode>
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: Constant.IconStyle.XMark)
                        .iconStyle()
                }
            })
    }
}

struct BackButtonStyle: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .customBackButton(presentationMode: presentationMode)
        }
        
    }
}

struct BackButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonStyle()
    }
}
