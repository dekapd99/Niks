//
//  Connectivity Manager.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import WatchConnectivity

class test {
    func callToAction(){
        
        AudioPlayer.shared.playpause()
        
    }
}

struct NotificationMessage: Identifiable {
    let id = UUID()
    let text: String
}

final class ConnectivityManager: NSObject, ObservableObject{
    
    let Testa = test()
    
    static let shared = ConnectivityManager()
    
    @Published var notificationMessage: NotificationMessage? = nil
    
    private override init() {
        
        super.init()
        
        if WCSession.isSupported() {
            
            WCSession.default.delegate = self
            
            WCSession.default.activate()
        }
    }
    
    private let MessageKey = "message"
    
    func send(_ message: String) {
        
        let messagePassed = ["action" : message]
        
        guard WCSession.default.activationState == .activated else {
            return
        }
#if os(iOS)
        guard WCSession.default.isWatchAppInstalled else {
            return
        }
#else
        
        guard WCSession.default.isCompanionAppInstalled else {
            return
        }
#endif
        
        if WCSession.default.isReachable {
            
            let message = ["action" : "callToAction"]
            
            WCSession.default.sendMessage(messagePassed, replyHandler: nil){ error in
                print("Cannot Send Message")
                
            }
        }
    }
}



extension ConnectivityManager : WCSessionDelegate{
    
//    func callToAction(){
//
//        print("UDAH KE PRINT")
//
//    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
#if os(iOS)
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    
    
#endif
    
    func sendMessage() {
        
        if WCSession.default.isReachable {
            
            let message = ["action" : "callToAction"]
            
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
#if os(iOS)
        
        print(message["action"] as? String)
        
        if let action = message["action"] as? String, action == "callToAction" {
            
            Testa.callToAction()
             
        }
        
#endif
        
    }
    
}

