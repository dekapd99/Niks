//
//  Connectivity Manager.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import WatchConnectivity




class ConnectivityManager: NSObject, ObservableObject{
    static let shared = ConnectivityManager()
    
    private override init() {
        super.init()
        
        if WCSession.isSupported(){
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    private let MessageKey = "message"
    
    func send(_ message:String){
        let messagePassed = ["action" : message]
        
        
        guard WCSession.default.activationState == .activated else{
            return
        }
        
#if os(iOS)
        guard WCSession.default.isWatchAppInstalled else{
            return
        }
#else
        guard WCSession.default.isCompanionAppInstalled else{
            return
        }
        
#endif
        
        WCSession.default.sendMessage(messagePassed, replyHandler: nil){
            error in print("Message cant be send")
        }
    }
    
}

extension ConnectivityManager: WCSessionDelegate{
    
    func callToAction(){
        print(#function)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
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
            callToAction()
        }
#else
        if WCSession.default.isReachable {
            let message = ["action" : "callToAction"]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: nil)
        }
#endif
    }
    
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
#endif
    
}
