//
//  SwiftUIView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/12.
//

import SwiftUI

struct ChagokPauseView: View {
    
    @State var blurView: UIVisualEffectView = .init()
    @State var defaultBlurRadius: CGFloat = 0
    @State var defaultSaturationAmount: CGFloat = 0
    
    @Binding var gameSelection: GameSelection
    @Binding var chagokStatus: ChagokStatus
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            VStack {
                Button {
                    chagokStatus = .game
                } label: {
                    chagokPauseButton(systemName: "play", text: "Continue")
                }
                Spacer()
                Button {
                    gameSelection = .none
                } label: {
                    chagokPauseButton(systemName: "house", text: "Home")
                }
                
                Spacer()
                Button {
                    // 게임 상황 리셋하는 코드 만들기
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
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokPauseView(gameSelection: .constant(.chagok), chagokStatus: .constant(.pause))
    }
}

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
                blurView = view
                if defaultBlurRadius == 0 {
                    defaultBlurRadius = view.gaussianBlurRadius
                }
                if defaultSaturationAmount == 0 {
                    defaultSaturationAmount = view.saturationAmout
                }
                view.gaussianBlurRadius = 4.5
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .frame(width: 170, height: 137)
    }
}
