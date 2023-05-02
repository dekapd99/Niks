//
//  TutorialView.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

struct TutorialView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Color("LightBlue")
            
            VStack(alignment: .center) {
                HStack {
                    Image(systemName: "xmark.circle")
                        .iconStyle()
                    Spacer()
                    Image(systemName: "questionmark.circle")
                        .iconStyle()
                }
                
                Text("Standing Forward Bend \n (Uttanasana)")
                    .titleStyle()
                
                Image("Character")
                    .resizable()
                    .frame(width: 117, height: 352)
                
                Text("Stand with feet hips width apart, inhale deeply and exhale to extend your torso forward over your legs, holding onto your elbows or resting your hands on your shins or floor for a forward bend that elongates the spine and relaxes the neck and shoulders.")
                    .descriptionStyle()
                    .frame(width: 855)
                
                Button {
                    print("Tapped")
                } label: {
                    Text("Start")
                        .buttonStyle()
                }

                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }//: - BODY
}

//MARK: - PREVIEW
struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
