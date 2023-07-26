//
//  BestScoreShareView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct BestScoreShareView: View {
    /*
     UserDefaults.standard.string(forKey: "BubbleScore") ?? "0"
     String(UserDefaults.standard.integer(forKey: "chagokScore"))
     */
    
    var bestScore: String
    var gameSelected: GameSelection = .chagok
    
    var body: some View {
        ZStack {
            //Image("BackgroundBestScoreShare")
            Image("Share_BestScore_\(gameSelected)")
            //Share_BestScore_Star
                .resizable()
                .frame(width: 393, height: 393)
            VStack(spacing: 0) {
                Spacer().frame(height: 48)
                
                Text("Best Score!")
                    .pretendardBold20()
                    .foregroundColor(.Yellow)
                
                Spacer().frame(height: 10)
                
                Text("     축하합니다 🎉\nBest Score를 달성하셨습니다!")
                    .pretendardSemiBold24()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
                
                Spacer().frame(height: 20)
                
                VStack(spacing: 12) {
                    Text(bestScore)
                        .font(.custom("PostNoBillsJaffna-Medium", size: 72))
                        .foregroundColor(.white)
                    
                    Text(gameSelected.rawValue)
                        .pretendardRegular20()
                        .foregroundColor(.white)
                }
                .padding(.bottom, 88)
            }
            .frame(width: 393, height: 393)
        }
        .frame(width: 393, height: 393)
    }
}
//
//struct BestScoreShareView_Previews: PreviewProvider {
//    static var previews: some View {
//        BestScoreShareView()
//    }
//}
