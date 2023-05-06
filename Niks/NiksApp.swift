//
//  NiksApp.swift
//  Niks
//
//  Created by Deka Primatio on 25/04/23.
//

import SwiftUI
import UserNotifications

@main
struct NiksApp: App {

    init() {
          UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
              if let error = error {
                  print("Error requesting authorization for notifications: \(error.localizedDescription)")
              }
          }
      }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
