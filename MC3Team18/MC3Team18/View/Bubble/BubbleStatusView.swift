//
//  BubbleMainView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI



struct BubbleStatusView: View {

    @Binding var gameSelection: GameSelection
    @State var bubbleStatus: BubbleStatus = .tutorial
            
    @AppStorage("bubbleScore") var bubbleHighScore: String = "0"
    @State var isBestScore: Bool = false
    @State var score: String = "0"
    
    @AppStorage("isNeverShowingBubbleTutorial") var isNeverShowingBubbleTutorial: Bool = false
    @State var isShowingBubbleTutorial: Bool = true

    @State var currentExpressionIndex: Int = 0
    @State var backgroundOffset: CGFloat = -700
    @State var scale: CGFloat = 0.02
    @State var currentBubbleImageIndex = 0
    @ObservedObject var observer: AudioStreamObserver

    var streamManager: AudioStreamManager
    
    @State var offsetX: CGFloat = 0
    @State var offsetY: CGFloat = 0
    
    
    init(gameSelection: Binding<GameSelection>) {
        _gameSelection = gameSelection
        observer = AudioStreamObserver()
        streamManager = AudioStreamManager()
        streamManager.resultObservation(with: observer)
    }
    
    var body: some View {
        ZStack {
            Color.clear.overlay{
                BubbleMainView(bubbleStatus: $bubbleStatus, currentExpressionIndex: $currentExpressionIndex, backgroundOffset: $backgroundOffset, scale: $scale, currentBubbleImageIndex: $currentBubbleImageIndex, offsetX: $offsetX, offsetY: $offsetY)
            }
                .onAppear {
                    if isNeverShowingBubbleTutorial {
                        bubbleStatus = .waiting
                    } else {
                        bubbleStatus = .tutorial
                    }
                }
            
            switch bubbleStatus {
            case .tutorial:
                BubbleTutorialView(bubbleStatus: $bubbleStatus)
            case .waiting:
                BubbleWaitingView(gameSelection: $gameSelection, bubbleStatus: $bubbleStatus, streamManager: streamManager, observer: observer)
            case .game:
                BubbleGameView(bubbleStatus: $bubbleStatus, observer: observer, streamManager: streamManager, currentExpressionIndex: $currentExpressionIndex, backgroundOffset: $backgroundOffset, scale: $scale, score: $score, bubbleHighScore: $bubbleHighScore, offsetX: $offsetX, offsetY: $offsetY, isBestScore: $isBestScore)
            case .gameover:
                BubbleGameOverView(bubbleStatus: $bubbleStatus, gameSelection: $gameSelection, score: $score, bubbleHighScore: $bubbleHighScore, isBestScore: $isBestScore, streamManager: streamManager)
            }
        }
    }
}

struct BubbleMainView: View {
    @Binding var bubbleStatus: BubbleStatus
    
    @Binding var currentExpressionIndex: Int
    @Binding var backgroundOffset: CGFloat
    @Binding var scale: CGFloat
    @Binding var currentBubbleImageIndex: Int
    
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    
    let expressionImagesYOffset = [-4.0, 0.0, -8.0]
    let expressionImages = ["ExpressionDefault", "ExpressionSleepy", "ExpressionTired",  "ExpressionGameover"]

    let animationGumSizeMaxDuration: Double = 17
    let bubbleImages = ["BubblePink","BubbleOrange", "BubbleBlue"]
  
    let animationBackgroundMaxDuration: Double = 30
   
    var body: some View {
        ZStack {
            // MARK: 배경 이미지
            Image("BackgroundBubble")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: backgroundOffset)
                .animation(bubbleStatus == .game ? .linear(duration: animationBackgroundMaxDuration): .default, value: backgroundOffset)
            
            // MARK: 캐릭터 바디
            Image("MainCharacterBody")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 201)
                .padding(.top, 60)
                .opacity(bubbleStatus == .tutorial ? 0 : 1)

            // MARK: 캐릭터 표정
            VStack {
                Spacer()
                Image(expressionImages[currentExpressionIndex])
                    .offset(x: -1, y: expressionImagesYOffset[currentExpressionIndex])
                    .opacity(bubbleStatus == .tutorial ? 0 : 1)
            }
            .frame(width: 68, height: 52)
            .padding(.bottom, 78)
            .padding(.top, 60)

            // MARK: 버블껌 이미지
            Image(bubbleImages[currentBubbleImageIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale, anchor: .top)
                .offset(y: 198)//.padding(.top, 60)
                .offset(x: offsetX, y: offsetY)
                .animation(bubbleStatus == .game ? .easeOut(duration: animationGumSizeMaxDuration): .default, value: [scale])
                .opacity(bubbleStatus == .tutorial ? 0 : 1)
        }
    }
}

//struct BubbleMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleMainView(backgroundOffset: -740)
//    }
//}
