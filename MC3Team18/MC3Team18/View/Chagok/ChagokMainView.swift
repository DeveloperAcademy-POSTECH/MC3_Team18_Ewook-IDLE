//
//  ChagokMainView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/12.
//

import SwiftUI

struct ChagokMainView: View {
    
    @Binding var gameSelection: GameSelection
    @State private var chagokStatus: ChagokStatus = .tutorial
    
    var body: some View {
        ZStack {
            switch chagokStatus {
            case .tutorial:
                ChagokTutorialView(chagokStatus: $chagokStatus)
            case .game:
                ChagokGameView(chagokStatus: $chagokStatus)
            case .pause:
                ChagokPauseView(gameSelection: $gameSelection, chagokStatus: $chagokStatus)
            case .gameover:
                ChagokGameOverView(gameSelection: $gameSelection, chagokStatus: $chagokStatus)
            }
        }
        .onAppear {
            // 만약 게임이 처음이 아니라면
            if false {
                chagokStatus = .game
            }
        }
    }
}

struct ChagokMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokMainView(gameSelection: .constant(.chagok))
    }
}
