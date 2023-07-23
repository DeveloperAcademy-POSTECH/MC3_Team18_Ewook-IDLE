//
//  StarPauseView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/07/23.
//

import SwiftUI

struct StarPauseView: View {
    @State var pauseOpacity: Double = 0
    @Binding var starStatus: StarStatus
    @Binding var gameSelection: GameSelection
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            VStack(spacing: 60) {
                Button {
                    withAnimation(.easeOut(duration: 0.3)) {
                        pauseOpacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        starStatus = .game
                    }
                    // TODO: 화면 업데이트 중지 및 재개 기능??
                } label: {
                    starPauseButton(systemName: "play", text: "Continue")
                }
                Button {
                    // TODO: 게임 리셋, 화면 이동(애니메이션)
                    starStatus = .tutorial
                    withAnimation(.easeOut(duration: 0.3)) {
                        gameSelection = .none
                    }
                } label: {
                    starPauseButton(systemName: "house", text: "Home")
                }
                
                Button {
                    // TODO: 게임 리셋
                    withAnimation(.easeOut(duration: 0.3)) {
                        pauseOpacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        starStatus = .game
                    }
                } label: {
                    starPauseButton(systemName: "arrow.clockwise", text: "Retry")
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

struct StarPauseView_Previews: PreviewProvider {
    static var previews: some View {
        StarPauseView(starStatus: .constant(.pause), gameSelection: .constant(.star))
    }
}



extension StarPauseView {
    
    func starPauseButton(systemName: String, text: String) -> some View {
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
