//
//  BanjjakGameOverView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct BanjjakGameOverView: View {
    @State var gameoverOpacity: Double = 0
    
    @Binding var banjjakStatus: BanjjakStatus
    @Binding var secondsx4: Int
    @Binding var gameSelection: GameSelection
    @Binding var isBestScore: Bool

    @AppStorage("ChagokMissionSuccess") var ChagokMissionSuccess: Bool = false
    @AppStorage("BubbleMissionSuccess") var BubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var BanjjakMissionSuccess: Bool = false
    @AppStorage("hasDailyMissionPrizeBeenShown") var hasDailyMissionPrizeBeenShown: Bool = false
    @State var showDailyPrize: Bool = false

    @AppStorage("totalCoin") var totalCoin: Int = 1000
    
    @EnvironmentObject var banjjakSKScene: BanjjakSKScene
    @EnvironmentObject var streamManager: BanjjakAudioStreamManager
    
    let banjjakMissionCount: Int = 10
    @Binding var banjjakScore: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75)
            
            VStack {
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
                Spacer()
            }
            .padding(.top, 60)
            .padding(.trailing, 26)
            
            VStack{
                VStack(spacing: 12){
                    Spacer().frame(height: 158)
                    if isBestScore {
                        Text("Best Score!")
                            .pretendardBold20()
                            .foregroundColor(.Yellow)
                    } else {
                        Text("Your Score")
                            .pretendardLight32()
                            .foregroundColor(.white)
                    }
                    Text(String(banjjakSKScene.score))
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text(banjjakScore)
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                .padding(.bottom, 32)
                
                if showDailyPrize {
                    DailyQuestPrizeView()
                } else {
                    GameCoinPrizeView(coinPrize: Int(banjjakSKScene.score / 100))
                }
                Spacer()
                
                HStack(spacing: 40){
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            isBestScore = false
                            banjjakSKScene.isPaused = false
                            banjjakSKScene.removeAllChildren()
                            banjjakStatus = .tutorial
                            secondsx4 = 120
                            banjjakSKScene.score = 0
                            gameSelection = .none
                            streamManager.stopAudioStream()
                        }
                    } label: {
                        gameOverGlassMorphicButtonLabel(systemName: "house", text: "Home", width: 136, height: 96)
                    }
                    
                    Button {
                        isBestScore = false
                        banjjakSKScene.isPaused = false
                        banjjakSKScene.isStarted = false
                        withAnimation(.easeOut(duration: 0.3)) {
                            gameoverOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            banjjakSKScene.score = 0
                            banjjakStatus = .game
                        }
                        banjjakSKScene.removeAllChildren()
                    } label: {
                        GameButtonLabel(width: 136, height: 96, systemName: "arrow.clockwise", buttonText: "Retry")
                    }
                    .buttonStyle(GameOverButtonStyle(gameSelection: .banjjak))
                }
                .padding(.bottom, 83)
            }
        }
        .opacity(gameoverOpacity)
        .statusBarHidden()
        .ignoresSafeArea()
        .overlay {
            VStack {
                if isBestScore {
                    LottieView(filename: "CelebLottieAnima")
                        .frame(width: 232, height: 66)
                        .padding(.top, 108)
                }
                Spacer()
            }
        }
        .onAppear {
            //MARK: BanjjakMissionSuccess 데이터 연결
            if (banjjakSKScene.score / 300) >= banjjakMissionCount {
                BanjjakMissionSuccess = true
            }
            UIApplication.shared.isIdleTimerDisabled = false
            
            banjjakSKScene.isPaused = true
            totalCoin = totalCoin + Int(banjjakSKScene.score / 100)
            
            check()
            
            withAnimation(.easeOut(duration: 0.3)) {
                gameoverOpacity = 1
            }
        }
    }
    
    func check() {
        //TODO: hasDailyMissionPrizeBeenShown 다음날인 경우 false
        if hasDailyMissionPrizeBeenShown == true { return }
        
        if ChagokMissionSuccess && BubbleMissionSuccess && BanjjakMissionSuccess {
            showDailyPrize = true
            hasDailyMissionPrizeBeenShown = true
        }
    }
}

struct BanjjakGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        BanjjakGameOverView(banjjakStatus: .constant(.gameover), secondsx4: .constant(0), gameSelection: .constant(.banjjak), isBestScore: .constant(true), banjjakScore: .constant("0"))
    }
}

extension BanjjakGameOverView {
    func banjjakGameOverViewButton(systemName: String, text: String) -> some View {
        return GlassMorphicCard()
            .overlay {
                Image("ButtonGameOverBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .pretendardSemiBold20()
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

extension BanjjakGameOverView {
    
    @MainActor
    var photo: TransferableUIImage {
        return .init(uiimage: dailyShareUIImage, caption: "SounDrill 기록 공유하기")
    }
    
    @MainActor
    var dailyShareUIImage: UIImage {
        let renderer = ImageRenderer(content: BestScoreShareView(bestScore: banjjakScore, gameSelected: gameSelection))
        renderer.scale = 3.0
        return renderer.uiImage ?? .init()
    }
}
