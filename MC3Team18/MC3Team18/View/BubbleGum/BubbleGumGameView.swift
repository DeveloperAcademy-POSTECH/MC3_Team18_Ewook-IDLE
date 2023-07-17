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
    var offsetValue: CGFloat = -740.0

    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    
    var body: some View {
        ZStack {
            VStack(spacing: 45){
                HStack{
                    Text("Best Score")
                        .pretendardRegular24()
                        .foregroundColor(.LightGray)
                    
                    Text("120.0")
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
                        }
                    }
                    .onAppear{
                        self.stopTimer()
                        self.startGame()
                    }
                    .onChange(of: observer.currentSound) { _ in
                        //print("\(observer.currentSound)" + "\(observer.topResults[0].confidence)")
                        if observer.currentSound == "Background" {
                            self.endGame()
                        }
                    }
            }
            .padding(.bottom, 560)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func startGame() {
        Haptics.success()
        self.startTimer()
        isTimerRunning = true
        
        scale += 0.8
        backgroundOffset += -offsetValue * 2 - 20
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation(.linear(duration: 0.4)) {
                offsetX = CGFloat.random(in: -2...2) // 랜덤 좌우 이동
                offsetY = CGFloat.random(in: -2...2)
            }
        }
    }
    
    private func endGame() {
        Haptics.error()
        streamManager.removeTap()
        bubbleGumStatus = .gameover
        
        self.stopTimer()
        isTimerRunning = false
        score = timerString
        timerString = "0.0"
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
