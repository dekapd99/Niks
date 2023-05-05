//
//  ContentView.swift
//  Niks
//
//  Created by Deka Primatio on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var previewStretch = false
    //MARK: - BODY
    var body: some View {
        if !previewStretch {
            HomePageView(previewStretch: $previewStretch)
        }else {
            StrechPreview(previewStretch: $previewStretch)
        }
        
    }//: - BODY
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
