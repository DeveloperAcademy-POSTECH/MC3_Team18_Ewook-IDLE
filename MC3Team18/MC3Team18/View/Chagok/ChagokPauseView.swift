//
//  SwiftUIView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/12.
//

import SwiftUI

struct ChagokPauseView: View {
    
    @Binding var gameSelection: GameSelection
    @Binding var chagokStatus: ChagokStatus
    @EnvironmentObject var chagokScene: ChagokSKScene
    @Binding var secondsx4: Int
    @State var pauseOpacity: Double = 0
    
    @Binding var isStarted: Bool
    @Binding var tapToStartOpacity: Double
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            VStack {
                Button {
                    withAnimation(.easeOut(duration: 0.3)) {
                        chagokStatus = .game
                    }
                    chagokScene.isNotUpdate = false
                } label: {
                    GameOverButtonLabel(width: 167, height: 134, systemName: "play", buttonText: "Continue")
                }
                .buttonStyle(PauseButtonStyle(gameSelection: .chagok))
                
                Spacer()
                Button {
                    // 게임 상황 리셋하는 코드 만들기 (점수 초기화 구현 상태, 스택 초기화, 타이머 초기화 구현되어야함)
                    chagokScene.chagokScore = 0
                    chagokScene.leftCupStack.shuffle()
                    chagokScene.rightCupStack.removeAll()
                    chagokScene.currentIndex = 4
                    chagokScene.removeAllChildren()
                    chagokScene.mouthState = .none
                    secondsx4 = 120
                    chagokScene.isNotUpdate = false
                    chagokStatus = .tutorial
                    withAnimation(.easeOut(duration: 0.3)) {
                        gameSelection = .none
                    }
                } label: {
                    gameOverGlassMorphicButtonLabel(systemName: "house", text: "Home", width: 167, height: 134)
                }
                
                Spacer()
                Button {
                    // 게임 상황 리셋하는 코드 만들기 (점수 초기화 구현 상태, 스택 초기화, 타이머 초기화 구현되어야함)
                    chagokScene.chagokScore = 0
                    chagokScene.leftCupStack.shuffle()
                    chagokScene.rightCupStack.removeAll()
                    chagokScene.currentIndex = 4
                    chagokScene.removeAllChildren()
                    chagokScene.mouthState = .none
                    chagokScene.boxCount = 0
                    secondsx4 = 120
                    chagokScene.isNotUpdate = true
                    isStarted = true
                    tapToStartOpacity = 1
                    withAnimation(.easeOut(duration: 0.3)) {
                        pauseOpacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        chagokStatus = .game
                    }
                } label: {
                    gameOverGlassMorphicButtonLabel(systemName: "arrow.clockwise", text: "Retry", width: 167, height: 134)
                }
            }
            .pretendardSemiBold24()
            .padding(.horizontal, 110)
            .padding(.vertical, 160)
        }
        .statusBarHidden()
        .opacity(pauseOpacity)
        .onAppear {
            chagokScene.isNotUpdate = true
            withAnimation(.easeOut(duration: 0.3)) {
                pauseOpacity = 1
            }
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChagokPauseView(gameSelection: .constant(.chagok), chagokStatus: .constant(.pause), chagokScore: .constant(0))
//    }
//}
