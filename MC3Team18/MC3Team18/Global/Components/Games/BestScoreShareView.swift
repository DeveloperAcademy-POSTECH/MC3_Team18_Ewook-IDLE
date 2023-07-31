//
//  BestScoreShareView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct BestScoreShareView: View {
    
    var bestScore: String
    var gameSelected: GameSelection = .chagok
    
    var body: some View {
        ZStack {
            Image("ShareBestScore_\(gameSelected)")
                .resizable()
                .frame(width: 393, height: 393)
            VStack(spacing: 0) {
                Spacer().frame(height: 56)
                Text("Best Score!")
                    .pretendardBold20()
                    .foregroundColor(.Yellow)
                Spacer().frame(height: 10)
                Group {
                    Text("     축하합니다 🎉")
                        .padding(.bottom, 8)
                    Text("최고기록을 달성하셨습니다!")
                        .padding(.bottom, 20)
                }
                .pretendardSemiBold24()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
                Text(bestScore)
                    .font(.custom("PostNoBillsJaffna-Medium", size: 80))
                    .foregroundColor(.white)
                Spacer().frame(height: 12)
                Text(gameSelected.rawValue)
                    .pretendardRegular20()
                    .foregroundColor(.white)
                    .offset(y: -30)
                Spacer()
            }
        }
        .frame(width: 393, height: 393)
    }
}

struct BestScoreShareView_Previews: PreviewProvider {
    static var previews: some View {
        BestScoreShareView(bestScore: "00")
    }
}
