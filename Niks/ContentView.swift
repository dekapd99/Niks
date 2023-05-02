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
        ZStack{
            BackgroundExampleView()
            GeometryReader { geometry in
                SidebarComponent(
                    toggle: $toggle,
                    bounds: CGPoint(
                        x: geometry.size.width,
                        y: geometry.size.height),
                    colorgrad: .white)
            }
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
