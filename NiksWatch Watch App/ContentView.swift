//
//  ContentView.swift
//  NiksWatch Watch App
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    
  
    var body: some View {
        VStack {
           
            Button{
                ConnectivityManager.shared.send("callToAction")
            }label: {
                Text("Play/Pause")
                
            }
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
