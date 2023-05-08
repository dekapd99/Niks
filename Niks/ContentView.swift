//
//  ContentView.swift
//  Niks
//
//  Created by Deka Primatio on 25/04/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var previewStretch = false
    @ObservedObject var viewModel: AnimatorViewModel = AnimatorViewModel()
    let TimerObj = Timer.publish(every: 0.1,
                                 on: .main,
                                 in: .common).autoconnect()
    
    //MARK: - BODY
    var body: some View {
        if !previewStretch {
            HomePageView(previewStretch: $previewStretch, viewModel: viewModel)
                .onAppear{
                    resetVar()
                    AudioPlayer.shared.playSound(sound: viewModel.musicCrate[viewModel.activeMusic].name)
                }
                .onReceive(TimerObj){ _ in
                    viewModel.buffer += 1
                    viewModel.counter += 1
                    if viewModel.buffer >= 2 {
                        viewModel.buffer = 0
                        viewModel.backgroundI = viewModel.backgroundI >= Constant.Scenery.RainSeq.Rains.count-1 ? 0 : viewModel.backgroundI + 1
                    }
                    if viewModel.counter >= 2 {
                        viewModel.counter = 0
                        
                    }
                    viewModel.charI = viewModel.charI >= Constant.AnimationModel.Idle.count-1 ? 0 : viewModel.charI + 1
                }
        }else {
            if !viewModel.end {
                StretchPreview(viewModel: viewModel,
                              previewStretch: $previewStretch)
                .onAppear{
                    viewModel.prevPage = 10
                }
                .onReceive(TimerObj){ _ in
                    if viewModel.currentTime == 0 && viewModel.delay == 10 && !viewModel.changed{
                        viewModel.changed = true
                        viewModel.stretchView = false
                        viewModel.incrementCurIndex()
                    }
                    if viewModel.prevPage != viewModel.curIndex && !viewModel.stretchView && previewStretch{
                        print("\(String(viewModel.prevPage != viewModel.curIndex && !viewModel.stretchView))")
                        viewModel.prevPage = viewModel.curIndex
                        AudioPlayer.shared.playSound(sound: viewModel.data[viewModel.curIndex].music)
                        
                    }
                    viewModel.getOperation()
                    viewModel.playAnimation()
                }
            } else {
                SleepView()
            }
        }
    }//: - BODY
    func resetVar() -> (){
        viewModel.frame = 0
        viewModel.curIndex = 0
        viewModel.stretchView = false
        viewModel.backgroundI = 0
        viewModel.buffer = 0
    }
}

//MARK: - PREVIEW
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
