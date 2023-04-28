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
    var body: some View {
        CircularProgressBar(timer: timer, colorgrad: colorgrad)
    }
}

struct CircularProgressBar: View {
    let diameter: CGFloat = 150
    let smoothness: CGFloat = 1.5
    let wideness: CGFloat = 30
    let fontgrad: Font = .title
    let fontsize: CGFloat = 20
    let opt: Int = 0
    let shadowOpac: CGFloat = 0.4
    var colorPrimary: Color {return colorgrad.opacity(0.3)}
    var colorSecondary: Color {return colorgrad}
    @State var currentTime: CGFloat = 0
    @State var timer: CGFloat
    @State var opacTimer: CGFloat = 5
    let colorgrad: Color
    var body: some View {
        let TimerObj = Timer.publish(every: 1,
                                     on: .main,
                                     in: .common).autoconnect()
        ZStack {
            Circle()
                .stroke(
                    colorPrimary,
                    lineWidth: wideness
                )
            Circle()
                .trim(from: 0, to: getProgress())
                .stroke(
                    colorSecondary,
                    style: StrokeStyle(
                        lineWidth: wideness,
                        lineCap: .round
                    )
                )
                .opacity(getOpacTimer())
                .rotationEffect(.degrees(-90))
                .shadow(color: .gray.opacity(shadowOpac), radius: 30, x: 0, y: 0.5)
                .animation(.easeInOut(duration: smoothness), value: currentTime)
                
            Text("\(getText())")
                .font(.system(size: fontsize, weight: .light, design: .rounded))
                .opacity(currentTime == 0 ? 0.3 : 0.8)
                .foregroundColor(colorSecondary)
        }
        .onAppear(perform: {currentTime = getInitialVal()})
        .onReceive(TimerObj, perform: { _ in getOperation()})
        .frame(width: diameter,
               height: diameter,
               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    func getProgress() -> CGFloat {
        return currentTime/timer < 0 ? 0 : currentTime/timer
    }
    func decrementTime() -> () {
        currentTime = currentTime <= 0 ? 0 : currentTime - 1
    }
    func incrementTime() -> () {
        currentTime = currentTime >= timer ? timer : currentTime + 1
    }
    func getText() -> String {
        guard opt >= 0 || opt < 2 else { return "" }
        if opt == 1 {
            return "\(Int((getProgress()*100).rounded(.up)))%"
        }else {
            return "00:\(Int(currentTime.rounded(.up)) < 10 ? "0" : "")\(Int(currentTime.rounded(.up)))"
        }
    }
    func getOperation() -> () {
        guard opt >= 0 || opt < 2 else { return }
        if opt == 1 {
            incrementTime()
        }else {
            decrementTime()
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
        return currentTime == 0 ? 0 : 1
    }
}

struct TimerComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimerComponent(timer: 30,
                       colorgrad: .teal)
    }
}
