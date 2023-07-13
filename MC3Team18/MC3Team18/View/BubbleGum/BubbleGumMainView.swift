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
    private let animationGumSizeMaxDuration: Double = 30.0
    private let animationBackgroundMaxDuration: Double = 60.0
    private var offsetValue: CGFloat = -740.0
    @State private var backgroundOffset = -740.0
    
    private let bubbleImages = ["BubbleGumPink","BubbleGumOrange", "BubbleGumBlue"]
    @State private var currentBubbleImageIndex = 0
    
    private let expressionImages = ["ExpressionDefault", "ExpressionSleepy", "ExpressionTired",  "ExpressionGameover"]
    private let expressionImagesYOffset = [-4.0, 0.0, -8.0]
    @State private var currentExpressionIndex = 0
    
    @State var isTimerRunning = false
    @State private var startTime = Date()
    @State private var timerString = "0"
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            // MARK: 배경 이미지
            Image("BackgroundBubbleGum")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: backgroundOffset)
                .animation(.linear(duration: animationBackgroundMaxDuration), value: backgroundOffset)
            
            VStack(){
                Text(isTimerRunning ? self.timerString : "")
                    .postNoBillsJaffnaRegular64()
                    .foregroundColor(.White)
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            timerString = String(format: "%.f", (Date().timeIntervalSince(self.startTime)))
                            currentExpressionIndex = (Int(timerString)! / 10) % (expressionImages.count-1)
                        }
                    }
                    .onAppear{
                        self.stopTimer()
                    }
                
                Text((isShowingTutorial || isShowingStartTitle) ? "" : "소리를 내면 시작합니다")
                    .pretendardSemiBold24()
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.12), radius: 12, x: 1, y: 2)
            }
            .padding(.bottom, 440)
            
            
            // MARK: 캐릭터 바디
            Image("MainCharacterBody")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 201)
                .onTapGesture {
                    startGame()
                }
            
            
            // MARK: 캐릭터 표정
            VStack {
                Spacer()
                Image(expressionImages[currentExpressionIndex])
                    .offset(y: expressionImagesYOffset[currentExpressionIndex])
            }
            .frame(width: 68, height: 52)
            .padding(.bottom, 78)
            
            
            // MARK: 버블껌 이미지
            Image(bubbleImages[currentBubbleImageIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale, anchor: .top)
                .animation(.easeInOut(duration: animationGumSizeMaxDuration), value: [scale])
                .offset(y: 168)
            
            if isShowingTutorial {
                BubbleGumTutorialView(isShowingTutorial: $isShowingTutorial)
                    .padding(.top, -offsetValue)
                    .padding(.bottom, -offsetValue)
            }
        }
    }
    
    private func startGame() {
        isShowingStartTitle = true
        
        if isTimerRunning {
            self.stopTimer()
        }
        else {
            timerString = "0"
            startTime = Date()
            self.startTimer()
        }
        isTimerRunning.toggle()
        
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
