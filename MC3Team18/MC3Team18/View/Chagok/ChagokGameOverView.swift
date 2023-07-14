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
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 13) {
                Spacer().frame(height: 157)
                Text("Your Score")
                    .pretendardLight32()
                Text("140")
                    .postNoBillsJaffnaRegular64()
                HStack {
                    Text("Best Score")
                        .pretendardRegular24()
                        .foregroundColor(.LightGray)
                    Text("140")
                        .pretendardSemiBold24()
                        .foregroundColor(.Yellow)
                }
                Spacer()
                HStack(spacing: 60) {
                    Button {
                        gameSelection = .none
                    } label: {
                        chagokGameOverButton(systemName: "house", text: "Home")
                    }
                    Button {
                        // 게임 상태 초기화 만들기
                        chagokStatus = .game
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
    }
}

struct ChagokGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokGameOverView(gameSelection: .constant(.chagok), chagokStatus: .constant(.gameover))
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
