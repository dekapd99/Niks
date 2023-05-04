//
//  ContentView.swift
//  Niks
//
//  Created by Deka Primatio on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var toggle = true
    //MARK: - BODY
    var body: some View {
        HomePageView()
    }//: - BODY
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
