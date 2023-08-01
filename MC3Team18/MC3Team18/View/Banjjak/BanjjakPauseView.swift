//
//  StarPauseView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct BanjjakPauseView: View {
    
    @State var pauseOpacity: Double = 0
    @Binding var banjjakStatus: BanjjakStatus
    @Binding var gameSelection: GameSelection
    @Binding var secondsx4: Int
    
    @EnvironmentObject var banjjakSKScene: BanjjakSKScene
    @EnvironmentObject var streamManager: BanjjakAudioStreamManager
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            VStack(spacing: 60) {
                Button {
                    banjjakSKScene.isPaused = false
                    withAnimation(.easeOut(duration: 0.3)) {
                        pauseOpacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        banjjakStatus = .game
                    }
                    // TODO: 화면 업데이트 중지 및 재개 기능??
                } label: {
                    GameOverButtonLabel(width: 167, height: 134, systemName: "play", buttonText: "Continue")
                }
                .buttonStyle(PauseButtonStyle(gameSelection: .chagok))
                Button {
                    // TODO: 게임 리셋, 화면 이동(애니메이션)
                    withAnimation(.easeOut(duration: 0.3)) {
                        banjjakSKScene.isPaused = false
                        banjjakSKScene.removeAllChildren()
                        banjjakStatus = .tutorial
                        secondsx4 = 120
                        gameSelection = .none
                        banjjakSKScene.score = 0
                        streamManager.stopAudioStream()
                    }
                } label: {
                    pauseGlassMorphicButtonLabel(systemName: "house", text: "Home", width: 167, height: 134)
                }
                
                Button {
                    // TODO: 게임 리셋
                    
                    withAnimation(.easeOut(duration: 0.3)) {
                        banjjakSKScene.isPaused = false
                        banjjakSKScene.removeAllChildren()
                        secondsx4 = 120
                        pauseOpacity = 0
                        banjjakSKScene.isStarted = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        banjjakSKScene.score = 0
                        banjjakStatus = .game
                    }
                } label: {
                    pauseGlassMorphicButtonLabel(systemName: "arrow.clockwise", text: "Retry", width: 167, height: 134)
                }
            }
            .pretendardBold20()
        }
        .statusBarHidden()
        .opacity(pauseOpacity)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                pauseOpacity = 1
            }
        }
    }
}

//struct BanjjakPauseView_Previews: PreviewProvider {
//    static var previews: some View {
//        BanjjakPauseView(banjjakStatus: .constant(.pause), gameSelection: .constant(.banjjak))
//    }
//}



extension BanjjakPauseView {
    
    func banjjakPauseButton(systemName: String, text: String) -> some View {
        return GlassMorphicCard()
            .overlay {
                Image("ButtonPauseBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                    Text(text)
                        .foregroundColor(.white)
                    
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
        .frame(width: 170, height: 137)
        .shadow(
            color: Color(.white).opacity(0.4), radius: 16
        )
    }
}
