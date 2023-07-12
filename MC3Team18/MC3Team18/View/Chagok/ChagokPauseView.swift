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
    
    var body: some View {
        ZStack {
            ChagokGameView(chagokStatus: .constant(.game))
            Color.black.opacity(0.4).ignoresSafeArea()
            VStack {
                Button {
                    chagokStatus = .game
                } label: {
                    VStack(spacing:9){
                        Image(systemName: "play")
                            .foregroundColor(.white)
                        Text("Continue")
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Button {
                    gameSelection = .none
                } label: {
                    VStack(spacing:9){
                        
                        Image(systemName: "house")
                            .foregroundColor(.white)
                        Text("Home")
                            .foregroundColor(.white)
                        
                    }
                }
                
                Spacer()
                Button {
                    chagokStatus = .tutorial
                } label: {
                    VStack(spacing:9){
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                        Text("Retry")
                            .foregroundColor(.white)
                        
                    }
                }
            }
            .pretendardSemiBold24()
            .padding(.horizontal, 110)
            .padding(.vertical, 160)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokPauseView(gameSelection: .constant(.chagok), chagokStatus: .constant(.pause))
    }
}
