//
//  GetReadyView.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct GetReadyView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Color("LightBlue")
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                HStack {
                    Image(systemName: "xmark.circle")
                        .iconStyle()
                    Spacer()
                }
                
                Text("Ujayi Breath")
                    .titleStyle()
                
                Image("CharacterPreview")
                    .padding()
                
                Text("Imagine fogging up a glass with your breath but keep your mouth shut.")
                    .descriptionStyle()
                
                Button {
                    print("Tapped")
                } label: {
                    Text("Continue")
                        .buttonStyle()
                }

                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }//: - BODY
}

//MARK: - PREVIEW
struct GetReadyView_Previews: PreviewProvider {
    static var previews: some View {
        GetReadyView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
