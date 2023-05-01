//
//  LoadingView.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct LoadingView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Color("LightBlue")
            
            VStack(spacing: 100) {
                LoadingComponent()
                
                Text("Tips: Let’s make a habit out of this to make you sleep easier!")
                    .descriptionStyle()
            }
        }
        .ignoresSafeArea()
    }//: - BODY
}

//MARK: - PREVIEW
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
