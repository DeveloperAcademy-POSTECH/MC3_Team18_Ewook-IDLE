//
//  BubbleGameOverView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGameOverView: View {
    @Binding var bubbleStatus: BubbleStatus
    @Binding var gameSelection: GameSelection
    @Binding var score: String
    @Binding var bubbleHighScore: String
    @Binding var isBestScore: Bool
    @State var gameoverOpacity: Double = 0

    @AppStorage("BubbleMissionSuccess") var BubbleMissionSuccess: Bool = false
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    var streamManager: AudioStreamManager

    var body: some View {
        ZStack {
            Color.black.opacity(0.75)
            
            VStack{
                HStack {
                    if isBestScore {
                        Spacer()
                        ShareLink(item: photo, subject: Text(""), message: Text(""), preview: SharePreview(
                            photo.caption,
                            image: photo.image)) {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFit()
                                    .pretendardSemiBold24()
                                    .foregroundColor(.Yellow)
                            }
                    }
                }
                .frame(height: 24)
                .padding(.bottom, 22)
                
                if isBestScore {
                    LottieView(filename: "CelebLottieAnima")
                        .frame(width: 232, height: 66).offset(y: 16)
                    Text("Best Score!")
                        .pretendardBold20()
                        .foregroundColor(.Yellow)
                } else {
                    Text("Your Score")
                        .pretendardLight32()
                        .foregroundColor(.white)
                }
                
                Spacer().frame(height: 11)
                
                VStack(spacing: 11){
                    
                    Text(score)
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text(bubbleHighScore)
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                
                Spacer().frame(minHeight: 224)
                
                HStack(spacing: 40){
                    
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            streamManager.stopAudioStream()
                            gameSelection = .none
                        }
                    } label: {
                        gameOverGlassMorphicButtonLabel(systemName: "house", text: "Home", width: 136, height: 96)
                    }
                    
                    Button {
                        bubbleStatus = .waiting
                    } label: { 
                        GameButtonLabel(width: 136, height: 96, systemName: "arrow.clockwise", buttonText: "Retry")
                    }
                    .buttonStyle(GameOverButtonStyle(gameSelection: .bubble))
                }
                Spacer().frame(minHeight: 120)
            }
            .padding(.horizontal, 26)
            .padding(.vertical, 60)
        }
        .ignoresSafeArea()
        .opacity(gameoverOpacity)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                gameoverOpacity = 1
            }
            UIApplication.shared.isIdleTimerDisabled = false
            if Int(score)! / 1000 >= 5{
                BubbleMissionSuccess = true
            }
            totalCoin = totalCoin + Int(Int(score)! / 100)
        }
    }
}

struct BubbleGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGameOverView(bubbleStatus: .constant(.gameover), gameSelection: .constant(.bubble), score: .constant("23.0"), bubbleHighScore: .constant("22.0"), isBestScore: .constant(true), streamManager: AudioStreamManager())
    }
}

extension BubbleGameOverView {
    
    @MainActor
    var photo: TransferableUIImage {
        return .init(uiimage: dailyShareUIImage, caption: "SounDrill 기록 공유하기")
    }
    
    @MainActor
    var dailyShareUIImage: UIImage {
        let renderer = ImageRenderer(content: BestScoreShareView(bestScore: bubbleHighScore, gameSelected: gameSelection))
        renderer.scale = 3.0
        return renderer.uiImage ?? .init()
    }
}
