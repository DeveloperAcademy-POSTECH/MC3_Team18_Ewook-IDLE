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
    @State var gameoverOpacity: Double = 0
    @Binding var secondsx4: Int
    
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
                        chagokScene.chagokScore = 0
                        chagokScene.leftCupStack.shuffle()
                        chagokScene.rightCupStack.removeAll()
                        chagokScene.currentIndex = 4
                        chagokScene.removeAllChildren()
                        chagokScene.mouthState = .none
                        chagokScene.boxCount = 0
                        secondsx4 = 120
                        chagokScene.isNotUpdate = false
                        withAnimation(.easeOut(duration: 0.3)) {
                            gameoverOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
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
            VStack {
                if isBestScore {
                    LottieView(filename: "CelebLottieAnima")
                        .frame(width: 232, height: 66)
                        .padding(.top, 108)
//                        .padding(.top, 80)
                    
                }
                Spacer()
            }
        }
        .statusBarHidden()
        .opacity(gameoverOpacity)
        .onAppear {
            chagokScene.isNotUpdate = true
            withAnimation(.easeOut(duration: 0.3)) {
                gameoverOpacity = 1
            }
        }
    }
}

struct ChagokGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameOverView(gameSelection: .constant(.chagok), chagokStatus: .constant(.gameover), isBestScore: .constant(true), secondsx4: .constant(120))
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
