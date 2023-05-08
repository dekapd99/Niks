//
//  SplashScreenView.swift
//  Niks
//
//  Created by Deka Primatio on 05/05/23.
//

import SwiftUI
import UserNotifications

struct SplashScreenView: View {
    //MARK: - PREVIEW
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    //MARK: - BODY
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color("Pink")
                    .ignoresSafeArea()
                
                ZStack {
                    Image("NiksIcon")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                
            }
            .ignoresSafeArea()
            .onAppear {
                // Request permission for user notifications
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                    if granted {
                        // Create a user notification content
                        let content = UNMutableNotificationContent()
                        content.title = "Niks"
                        content.body = "It's almost your sleeping time, relax your mind an body with yoga and listening to music from Niks tonight"
                        
                        // Create a trigger for daily notifications at 10 pm
                        var dateComponents = DateComponents()
                        dateComponents.hour = 13
                        dateComponents.minute = 44
                        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                        
                        // Create a notification request
                        let request =    UNNotificationRequest(identifier: "goToSleep", content: content, trigger: trigger)
                        
                        // Schedule the notification
                        UNUserNotificationCenter.current().add(request)
                    } else {
                        print("User notification permission not granted: \(error?.localizedDescription ?? "unknown error")")
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }//: - BODY
}

//MARK: - PREVIEW
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}
