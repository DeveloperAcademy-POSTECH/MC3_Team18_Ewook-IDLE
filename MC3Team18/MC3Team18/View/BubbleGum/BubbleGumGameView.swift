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
    @State var timerString = "0"
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @Binding var currentExpressionIndex: Int
    @Binding var backgroundOffset: CGFloat
    @Binding var scale: CGFloat
    
    @Binding var score: String
    @Binding var bubbleHighScore: String
    
    var offsetValue: CGFloat = -740.0
    
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    
    @State var shouldEnlargeText = false
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
                    .frame(height: 96)
                    .multilineTextAlignment(.center)
                    .scaleEffect(shouldEnlargeText ? 1.25 : 1)
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            timerString = String(format: "%.0f", (Date().timeIntervalSince(self.startTime))*1000)
                            currentExpressionIndex = Int((Double(timerString)! / 3000.0)) % (3)
                            
                            withAnimation(.linear(duration: 0.8)) {
                                offsetX = CGFloat.random(in: -2...2) // 랜덤 좌우 이동
                                offsetY = CGFloat.random(in: -2...2)
                            }
//                            if Int(Double(timerString) ?? 0) % 3 == 0 && shouldEnlargeText == false && Int(Double(timerString) ?? 0)
//                            != 0 {
//                                // 3초마다 shouldEnlargeText 값을 변경하여 글자 크기 조정
//                                withAnimation(.easeOut(duration: 0.2)) {
//                                    shouldEnlargeText = true
//                                }
//
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                                    withAnimation(.easeOut(duration: 0.2)) {
//                                        shouldEnlargeText = false
//                                    }
//
//                                }
//
//
//                            }
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
        SoundEffectPlayer.shared.playSoundEffect(soundName: SoundNames.bubblegumBlowEffect.rawValue)
        self.startTimer()
        isTimerRunning = true
        isBestScore = false
        scale += 0.8
        backgroundOffset += -offsetValue * 2 - 20
    }
    
    private func endGame() {
        HapticManager.instance.notification(type: .error)
        streamManager.stopAudioStream()
        bubbleGumStatus = .gameover
        SoundEffectPlayer.shared.stopSoundEffect()
//        SoundEffectPlayer.shared.playSoundEffect(soundName: SoundNames.bubblegumGameOverEffect.rawValue)
        
        self.stopTimer()
        isTimerRunning = false
        score = timerString
        timerString = "0"
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
