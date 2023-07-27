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
    @AppStorage("BalloonMissionSuccess") var BalloonMissionSuccess: Bool = false
    var streamManager: AudioStreamManager

    var body: some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            
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
                                    .frame(height: 24)
                                    .pretendardBold20()
                                    .foregroundColor(.Yellow)
                            }
                    }
                }
                .frame(height: 24)
                .padding(.top, 60)
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
                
                HStack(){
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            streamManager.stopAudioStream()
                            gameSelection = .none
                        }
                    } label: {
                        bubbleGameOverViewButton(systemName: "house", text: "Home")
                    }
                    
                    Spacer()
                    
                    Button {
                        //TODO: 튜토리얼 변수 따라 튜토리얼로 넘어가는 케이스 추가
                        bubbleStatus = .waiting
                    } label: {
                        bubbleGameOverViewButton(systemName: "arrow.clockwise", text: "Retry")
                    }
                }
                .padding(.horizontal, 36)
                
                Spacer().frame(minHeight: 120)
            }
            .padding(.horizontal, 26)
            .padding(.vertical, 60)
        }
        .onAppear {
            UIApplication.shared.isIdleTimerDisabled = false
            if Int(score)! / 1000 >= 5{
                BalloonMissionSuccess = true
            }
        }
    }
}

struct BubbleGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGameOverView(bubbleStatus: .constant(.gameover), gameSelection: .constant(.bubble), score: .constant("23.0"), bubbleHighScore: .constant("22.0"), isBestScore: .constant(true), streamManager: AudioStreamManager())
    }
}

extension BubbleGameOverView {
    func bubbleGameOverViewButton(systemName: String, text: String) -> some View {
        return GlassMorphicCard()
            .overlay {
                Image("ButtonGameOverBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .pretendardSemiBold24()
                        .frame(height: 25).scaledToFit()
                        .bold()
                    Text(text)
                        .foregroundColor(.white)
                        .pretendardBold24()
                }
            }
    }
    
    @ViewBuilder
    func GlassMorphicCard() -> some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterialLight) { view in
                view.gaussianBlurRadius = 4.5
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .frame(width: 104, height: 137)
        .shadow(
            color: Color(.white).opacity(0.4), radius: 16
        )
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
