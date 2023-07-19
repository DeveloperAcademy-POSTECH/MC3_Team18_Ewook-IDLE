//
//  ChagokGameOverView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokGameOverView: View {
    
    @Binding var gameSelection: GameSelection
    @Binding var chagokStatus: ChagokStatus
    @EnvironmentObject var chagokScene: ChagokSKScene
    @Binding var isBestScore: Bool
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.75).ignoresSafeArea()
            VStack(spacing: 13) {
                Spacer().frame(height: 157)
                
                if isBestScore {
                    Text("Best Score!")
                        .pretendardBold20()
                        .foregroundColor(.Yellow)
                }
                
                Text("Your Score")
                    .pretendardLight32()
                Text("\(chagokScene.chagokScore)")
                    .postNoBillsJaffnaRegular64()
                HStack {
                    Text("Best Score")
                        .pretendardRegular24()
                        .foregroundColor(.LightGray)
                    // 최고 점수로 교체하기
                    Text("\(UserDefaults.standard.integer(forKey: "chagokScore"))")
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                }
                Spacer()
                HStack(spacing: 60) {
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            gameSelection = .none
                        }
                    } label: {
                        chagokGameOverButton(systemName: "house", text: "Home")
                    }
                    Button {
                        // 게임 상태 초기화 만들기
                        chagokScene.isPaused = false
                        chagokScene.chagokScore = 0
                        withAnimation(.easeOut(duration: 0.3)) {
                            chagokStatus = .game
                        }
                    } label: {
                        chagokGameOverButton(systemName: "arrow.clockwise", text: "Retry")
                    }
                }
                .padding(.bottom, 160)
            }
            .ignoresSafeArea()
            .foregroundColor(.white)
        }
        .statusBarHidden()
        .onAppear {
            chagokScene.isPaused = true
        }
    }
}

struct ChagokGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameOverView(gameSelection: .constant(.chagok), chagokStatus: .constant(.gameover), isBestScore: .constant(true))
    }
}

extension ChagokGameOverView {
    
    func chagokGameOverButton(systemName: String, text: String) -> some View {
        
        return GlassMorphicCard()
            .overlay {
                Image("ButtonGameOverBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .pretendardSemiBold20()
                        .frame(width: 21, height: 26)
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
