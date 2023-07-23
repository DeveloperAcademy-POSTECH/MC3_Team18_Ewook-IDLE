//
//  BestScoreShareView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct BestScoreShareView: View {
    
    @State var bestScore = "0"
    var gameSelected: GameSelection = .chagok
    
    var body: some View {
        ZStack {
            Image("BackgroundBestScoreShare")
                .resizable()
                .frame(width: 393, height: 393)
            VStack {
                Spacer().frame(height: 79)
                Group {
                    Text("제법인걸요! 🎉")
                    Spacer()
                    Text("Best Score를 갱신하셨습니다!")
                }
                .pretendardSemiBold24()
                .foregroundColor(.white)
                Spacer().frame(height: 26)
                Text("Best Score!")
                    .pretendardBold20()
                    .foregroundColor(.Yellow)
                Text(bestScore)
                    .font(.custom("PostNoBillsJaffna-Medium", size: 80))
                    .foregroundColor(.white)
                
                
                Spacer().frame(height: 76)
            }
            .frame(width: 393, height: 393)
        }
        .frame(width: 393, height: 393)
        .onAppear {
            switch gameSelected {
            case .none:
                bestScore = "0"
            case .bubbleGum:
                bestScore = UserDefaults.standard.string(forKey: "BubbleScore") ?? "0"
            case .chagok:
                bestScore = String(UserDefaults.standard.integer(forKey: "chagokScore"))
            case .star:
                bestScore = "0"
            case .record:
                bestScore = "0"
            }
        }
    }
}

struct BestScoreShareView_Previews: PreviewProvider {
    static var previews: some View {
        BestScoreShareView()
    }
}
