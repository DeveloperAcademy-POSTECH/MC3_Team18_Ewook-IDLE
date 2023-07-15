//
//  BubbleGumGameView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/13.
//

import SwiftUI

struct BubbleGumGameView: View {
    @Binding var bubbleGumStatus: BubbleGumStatus

    @State var isTimerRunning = false
    @State var startTime = Date()
    @State var timerString = "0"
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
      
    @Binding var currentExpressionIndex: Int
    @Binding var backgroundOffset: CGFloat
    @Binding var scale: CGFloat

    @Binding var score: String
    var offsetValue: CGFloat = -740.0

    var body: some View {
        ZStack {
            VStack(){
                Text(isTimerRunning ? self.timerString : "")
                    .postNoBillsJaffnaRegular64()
                    .foregroundColor(.White)
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            timerString = String(format: "%.f", (Date().timeIntervalSince(self.startTime)))
                            currentExpressionIndex = (Int(timerString)! / 10) % (3)
                        }
                    }
                    .onAppear{
                        self.stopTimer()
                        startGame()
                    }
                    .onTapGesture {
                        self.endGame()
                        bubbleGumStatus = .gameover
                    }
            }
            .padding(.bottom, 440)
        }
    }

    private func startGame() {
        self.startTimer()
        isTimerRunning = true
        
        scale += 0.8
        backgroundOffset += -offsetValue * 2 - 20
    }
    
    private func endGame() {
        self.stopTimer()
        isTimerRunning = false
        score = timerString
        timerString = "0"
        scale = 0.02
        startTime = Date()
        backgroundOffset = -740
        currentExpressionIndex = 0
    }
    
    private func stopTimer(){
        self.timer.upstream.connect().cancel()
    }
    
    private func startTimer(){
        self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
}
//
//struct BubbleGumGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleGumGameView(bubbleGumStatus: .constant(.game))
//    }
//}
