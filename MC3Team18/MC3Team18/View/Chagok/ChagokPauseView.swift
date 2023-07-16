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
    @StateObject var chagokScene = ChagokSKScene(size: CGSize(width: 150, height: 300))
    @Binding var secondsx4: Int
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            VStack {
                Button {
                    chagokStatus = .game
                    chagokScene.isPaused = false
                } label: {
                    chagokPauseButton(systemName: "play", text: "Continue")
                }
                Spacer()
                Button {
                    // 게임 상황 리셋하는 코드 만들기 (점수 초기화 구현 상태, 스택 초기화, 타이머 초기화 구현되어야함)
                    chagokScene.chagokScore = 0
                    chagokScene.isPaused = false
                    gameSelection = .none
                } label: {
                    chagokPauseButton(systemName: "house", text: "Home")
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
                    secondsx4 = 120
                    chagokScene.isPaused = false
                    chagokStatus = .game
                } label: {
                    chagokPauseButton(systemName: "arrow.clockwise", text: "Retry")
                }
            }
            .pretendardSemiBold24()
            .padding(.horizontal, 110)
            .padding(.vertical, 160)
        }
        .statusBarHidden()
        .onAppear {
            chagokScene.isPaused = true
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChagokPauseView(gameSelection: .constant(.chagok), chagokStatus: .constant(.pause), chagokScore: .constant(0))
//    }
//}

extension ChagokPauseView {
    
    func chagokPauseButton(systemName: String, text: String) -> some View {
        
        return GlassMorphicCard()
            .overlay {
                Image("ButtonPauseBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
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
