//
//  LoadingComponent.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct LoadingComponent: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            Circle()
                .fill(Color("SoftWhite"))
                .frame(width: 44)
            
            Circle()
                .fill(Color("SoftWhite"))
                .frame(width: 108)
            
            Circle()
                .fill(Color("SoftWhite"))
                .frame(width: 44)
        }
    }//: - BODY
}

//MARK: - PREVIEW
struct LoadingComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoadingComponent()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
