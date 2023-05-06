//
//  TimerComponent.swift
//  Niks
//
//  Created by Abner Edgar on 27/04/23.
//

import SwiftUI

struct TimerComponent: View {
    let timer: CGFloat
    let colorgrad: Color
    let diameter: CGFloat
    let wideness: CGFloat
    @ObservedObject var viewModel: AnimatorViewModel
    var body: some View {
        CircularProgressBar(diameter: diameter,
                            wideness: wideness,
                            timer: timer,
                            colorgrad: colorgrad,
                            viewModel: viewModel)
    }
}

struct CircularProgressBar: View {
    let diameter: CGFloat
    let smoothness: CGFloat = 1.5
    let wideness: CGFloat
    let fontgrad: Font = .title
    var fontsize: CGFloat {return wideness - 10}
    let shadowOpac: CGFloat = 0.4
    var colorPrimary: Color {return colorgrad.opacity(0.3)}
    var colorSecondary: Color {return colorgrad}
    @State var timer: CGFloat
    @State var opacTimer: CGFloat = 5
    let colorgrad: Color
    @State var done: Bool = false
    @ObservedObject var viewModel: AnimatorViewModel
    var opt: Int {return viewModel.opt}
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    colorPrimary,
                    lineWidth: wideness
                )
                .background(.white)
                .cornerRadius(90)
            Circle()
                .trim(from: 0, to: getProgress())
                .stroke(
                    colorSecondary,
                    style: StrokeStyle(
                        lineWidth: wideness,
                        lineCap: .square
                    )
                )
                .opacity(getOpacTimer())
                .rotationEffect(.degrees(-90))
                .shadow(color: .gray.opacity(shadowOpac), radius: 30, x: 0, y: 0.5)
                .animation(.easeInOut(duration: smoothness), value: viewModel.currentTime)
            Text("\(Int(viewModel.currentTime))s")
                .titleStyle()
                .opacity(viewModel.currentTime == 0 ? 0.3 : 0.8)
                .foregroundColor(colorSecondary)
        }
        .onAppear(perform: {viewModel.currentTime = getInitialVal()})
//        .onReceive(TimerObj, perform: { _ in
//            if currentTime == 0 && !done{
//                isFinish()
//                done = true
//            }
//        })
        .frame(width: diameter,
               height: diameter,
               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    func getProgress() -> CGFloat {
        return viewModel.currentTime/timer < 0 ? 0 : viewModel.currentTime/timer
    }
    
    func getText() -> String {
        guard opt >= 0 || opt < 2 else { return "" }
        if opt == 1 {
            return "\(Int((getProgress()*100).rounded(.up)))%"
        }else {
            return "00:\(Int(viewModel.currentTime.rounded(.up)) < 10 ? "0" : "")\(Int(viewModel.currentTime.rounded(.up)))"
        }
    }
    func getInitialVal() -> CGFloat {
        guard opt >= 0 || opt < 2 else { return timer }
        if opt == 1 {
            return 0
        }else {
            return timer
        }
    }
    func getOpacTimer() -> CGFloat {
        return viewModel.currentTime == 0 ? 0 : 1
    }
}

//struct TimerComponent_Previews: PreviewProvider {
//    @State var isA: Bool = false
//    static var previews: some View {
//        TimerComponent(timer: 30,
//                       colorgrad: .teal,
//                       diameter: 150,
//                       wideness: 30,
//                       isActive: .constant(true))
//    }
//}
