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
    
    @State var isDailyFinished: Bool = false

    @Binding var gameSelected: GameSelection
    @State var totalCoinWithComma: String = "0"
    
    var body: some View {
        HStack(spacing: 0) {
            NavigationLink {
                ShopView()
            } label: {
                    Image("ShopIcon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
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
                        .opacity(isDailyFinished ?  0 : 1)
                    Image("IconNudge")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                }
            }
        }
        .frame(height: 48)
        .padding(.horizontal, 26)
        .onAppear{
            if ChagokMissionSuccess && BubbleMissionSuccess && BanjjakMissionSuccess {
                isDailyFinished = true
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
