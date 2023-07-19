//
//  BubbleGumGameView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/13.
//

import SwiftUI

struct BubbleGumGameView: View {
    @Binding var bubbleGumStatus: BubbleGumStatus
    
    @ObservedObject var observer: AudioStreamObserver
    var streamManager: AudioStreamManager
    
    @State var isTimerRunning = false
    @State var startTime = Date()
    @State var timerString = "0.0"
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @Binding var currentExpressionIndex: Int
    @Binding var backgroundOffset: CGFloat
    @Binding var scale: CGFloat
    
    @Binding var score: String
    @Binding var bubbleHighScore: String

    var offsetValue: CGFloat = -740.0

    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
   
    @Binding var isBestScore: Bool

    var body: some View {
        ZStack {
            VStack(spacing: 45){
                HStack{
                    Text("Best Score")
                        .pretendardRegular24()
                        .foregroundColor(.LightGray)
                    
                    Text(bubbleHighScore)
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                }
                .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                
                Text(isTimerRunning ? self.timerString : "")
                    .postNoBillsJaffnaRegular64()
                    .foregroundColor(.White)
                    .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            timerString = String(format: "%.1f", (Date().timeIntervalSince(self.startTime)))
                            currentExpressionIndex = Int((Double(timerString)! / 6.0)) % (3)
                            
                            withAnimation(.linear(duration: 0.8)) {
                                offsetX = CGFloat.random(in: -2...2) // 랜덤 좌우 이동
                                offsetY = CGFloat.random(in: -2...2)
                            }
                        }
                    }
                    .onAppear{
                        self.stopTimer()
                        self.startGame()
                    }
                    //.onChange(of: observer.currentSound) { _ in
                    .onChange(of: observer.topResults) { _ in
                        if observer.currentSound == "Background"  && observer.topResults[1].confidence <= 0.04  {
                            self.endGame()
                        }
                    }
            }
            .padding(.bottom, 500)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func startGame() {
        HapticManager.instance.notification(type: .success)
        self.startTimer()
        isTimerRunning = true
        isBestScore = false
        scale += 0.8
        backgroundOffset += -offsetValue * 2 - 20
    }
    
    private func endGame() {
        HapticManager.instance.notification(type: .error)
        streamManager.removeTap()
        bubbleGumStatus = .gameover
        
        self.stopTimer()
        isTimerRunning = false
        score = timerString
        timerString = "0.0"
        self.saveScore()
        
        scale = 0.02
        offsetX = 0
        offsetY = 0
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
    
    private func saveScore() {
        if Float(bubbleHighScore)! < Float(score)! {
            isBestScore = true
            bubbleHighScore = score
            UserDefaults.standard.set(score, forKey: "BubbleScore")
        }
    }
}
//
//struct BubbleGumGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleGumGameView(bubbleGumStatus: .constant(.game))
//    }
//}
