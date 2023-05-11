//
//  TotallySleepView.swift
//  Niks
//
//  Created by Deka Primatio on 06/05/23.
//

import SwiftUI

struct TotallySleepView: View {
    //MARK: - PROPERTIES
    @State private var countdown = 15 * 60 // 15 minutes in seconds
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image(Constant.BackgroundImage.BackgroundTotallySleep)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    Text("Niks will Close In")
                    Text("\(countdown / 60) minutes \(countdown % 60) seconds")
                        .onAppear {
                            startTimer()
                        }
                }
                .foregroundColor(Color("SoftWhite"))
                .titleStyle()
                .position(x: geometry.size.width / 2, y: geometry.size.height - 90)
            }
            
        }//: - ZSTACK WRAPPER
        
    }//: - BODY
    
    func startTimer() {
        let appTerminationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countdown -= 1
            if countdown == 0 {
                // Delay termination for 1 second to allow time for the view to update
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    exit(0)
                }
            }
        }
        appTerminationTimer.tolerance = 0.1
    }
}

//MARK: - PREVIEW
struct TotallySleepView_Previews: PreviewProvider {
    static var previews: some View {
        TotallySleepView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
