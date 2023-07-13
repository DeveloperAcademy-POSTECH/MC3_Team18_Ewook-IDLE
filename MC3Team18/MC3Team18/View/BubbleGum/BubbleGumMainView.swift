//
//  BubbleGumMainView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumMainView: View {
    @State var isShowingTutorial: Bool = true
    @State private var isShowingStartTitle = false

    @State private var scale: CGFloat = 0.02
    private let animationMaxDuration: Double = 12.0
    
    var offsetValue: CGFloat = -740.0
    @State private var backgroundOffset = -740.0
    @State private var currentImageIndex = 0
    private let images = ["BubbleGumPink","BubbleGumOrange", "BubbleGumBlue"]
    
    @State var isTimerRunning = false
    @State private var startTime = Date()
    @State private var timerString = "0"
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack(){
            Image("BackgroundBubbleGum")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: backgroundOffset)
                .animation(.linear(duration: animationMaxDuration), value: backgroundOffset)
            VStack(){
                //Text((isShowingTutorial || isShowingStartTitle) ? "" : self.timerString)
                Text(isTimerRunning ? self.timerString : "")
                    .postNoBillsJaffnaRegular64()
                    .foregroundColor(.White)
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            timerString = String(format: "%.f", (Date().timeIntervalSince(self.startTime)))
                        }
                    }
                   
                    .onAppear{
                        self.stopTimer()
                    }
                Text((isShowingTutorial || isShowingStartTitle) ? "" : "소리를 내면 시작합니다")
                    .pretendardSemiBold24()
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
                Spacer()
                Image("MainCharacter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 201)
                    .onTapGesture {
                        startGame()
                        if isTimerRunning {
                            self.stopTimer()
                        }
                        else {
                            timerString = "0"
                            startTime = Date()
                            self.startTimer()
                        }
                        isTimerRunning.toggle()
                    }
            }
            .padding(.top, -offsetValue + 161 )
            .padding(.bottom, -offsetValue + 276)
            
            Image(images[currentImageIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale, anchor: .top)
                .animation(.easeInOut(duration: animationMaxDuration), value: [scale])
                .offset(y: 210)
            
            if isShowingTutorial {
                BubbleGumTutorialView(isShowingTutorial: $isShowingTutorial)
                    .padding(.top, -offsetValue)
                    .padding(.bottom, -offsetValue)
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func startGame() {
        isShowingStartTitle = true
        
        scale += 0.8
        backgroundOffset += -offsetValue * 2 - 20
    }
    
    func stopTimer(){
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer(){
        self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
}

struct BubbleGumMainView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumMainView()
    }
}
