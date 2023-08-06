//
//  TrophyView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/22.
//

import SwiftUI
import Foundation

struct TrophyView: View {
    
    @AppStorage("ChagokMissionSuccess") var ChagokMissionSuccess: Bool = false
    @AppStorage("BubbleMissionSuccess") var BubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var BanjjakMissionSuccess: Bool = false
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    
    @State var isDailyNotFinished: Bool = false
    @Binding var gameSelected: GameSelection
    @State var totalCoinWithComma: String = "0"
    
    var body: some View {
        HStack(spacing: 0) {
            NavigationLink {
                ShopView()
            } label: {
                HStack(spacing: 8) {
                    Image("IconShop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text(totalCoinWithComma)
                        .postNoBillsJaffnaExtraBold20()
                        .foregroundColor(.Yellow)
                }
            }
            Spacer()
            NavigationLink {
                RecordView(gameSelected: $gameSelected)
            } label: {
                HStack(spacing: 4) {
                    Image("IconNudgeBackground")
                        .resizable()
                        .frame(width: 123, height: 24)
                        .overlay {
                            Text("데일리 연습 완성하기!")
                                .pretendardSemiBold12()
                                .foregroundColor(.white)
                        }
                        .opacity(isDailyNotFinished ? 1 : 0)
                    Image("IconNudge")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
            }
        }
        .frame(height: 40)
        .padding(.horizontal, 26)
        .onAppear{
            if !ChagokMissionSuccess || !BubbleMissionSuccess || !BanjjakMissionSuccess {
                isDailyNotFinished = true
            }
            totalCoinWithComma = totalCoin.addComma()
        }
    }
}

struct TrophyView_Previews: PreviewProvider {
    static var previews: some View {
        TrophyView(gameSelected: .constant(.none))
            .background(.black)
    }
}
