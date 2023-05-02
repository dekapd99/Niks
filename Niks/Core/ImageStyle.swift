//
//  ImageStyle.swift
//  Niks
//
//  Created by Deka Primatio on 02/05/23.
//

import SwiftUI

//MARK: - CUSTOM HOME & STRETCH CHARACTER MODIFIER
extension Image {
    func characterStyle() -> some View {
        self
            .resizable()
            .frame(width: 167, height: 552, alignment: .center)
            .padding()
    }
}

//MARK: - CUSTOM HALF CHARACTER MODIFIER
extension Image {
    func tutorialCharacterStyle() -> some View {
        self
            .resizable()
            .frame(width: 107, height: 352)
            .padding()
    }
}

struct ImageStyle: View {
    var body: some View {
        Image("Character")
            .tutorialCharacterStyle()
    }
}

struct ImageStyle_Previews: PreviewProvider {
    static var previews: some View {
        ImageStyle()
    }
}
