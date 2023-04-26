//
//  ExampleView.swift
//  Niks
//
//  Created by Deka Primatio on 26/04/23.
//

import SwiftUI

/**
 * THIS FILE ONLY PROVIDE AN EXAMPLE ASSETS USAGE
 * DO NOT DELETE THIS FILE
 */
struct ExampleView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        
        //MARK: - VSTACK CONTENT
        ZStack {
            Color("Purple")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text("XCode Default Font")
                    .font(.system(size: 32))
                
                Text("XCode Default Font (Bold)")
                    .font(.system(size: 32, weight: .bold))
                
                HStack {
                    Text("Title & Dialogue")
                        .font(.title)
                    
                    Text("Title & Dialogue")
                        .font(.system(size: 28))
                }
                
                HStack {
                    Text("Tips & Description")
                        .font(.title2)
                    
                    Text("Tips & Description")
                        .font(.system(size: 22))
                }

                HStack {
                    Text("Timer 15s")
                        .font(.largeTitle)
                    
                    Text("Timer 15s")
                        .font(.system(size: 34))
                }
                
                HStack {
                    Text("Number at Progress Bar")
                        .font(.title3)
                    
                    Text("Number at Progress Bar")
                        .font(.system(size: 20))
                }
                
                Button {
                    print("Button Pressed")
                } label: {
                    ZStack {
                        Color(.white)
                            .frame(width: 350, height: 70)
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 327, height: 50)
                            .foregroundColor(Color("Purple"))
                        Text("Button With Purple Color")
                            .foregroundColor(Color.white)
                    }
                }
                
                Button {
                    print("Button Pressed")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 350, height: 50)
                            .foregroundColor(Color.purple)
                        Text("Button With XCode Default Purple Color")
                            .foregroundColor(Color.white)
                    }
                }
            }//: - VSTACK CONTENT
        }
        
    }//: - BODY
}

//MARK: - PREVIEW
struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
