//
//  DailyQuestPrizeView.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/31/23.
//

import SwiftUI

struct DailyQuestPrizeView: View {
    
    @State var coinPrize : Int
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    let dailyMissionPrize = 300

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(.ultraThinMaterial)
                .frame(width: 341,height: 106).opacity(0.9)
            VStack(spacing:8){
                HStack(spacing:4){
                    Text("게임 획득 보상")
                        .pretendardMedium20()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.GamePrizeGradient1,.GamePrizeGradient2],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    Spacer()
                    Text("\(coinPrize)")
                        .postNoBillsJaffnaExtraBold24()
                        .foregroundColor(.white)
                    Image("IconShop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }.frame(height: 24)
                HStack(spacing:4) {
                    Text("Daily Mission 완료 보상")
                        .pretendardMedium20()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.GamePrizeGradient1,.GamePrizeGradient2],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    Spacer()
                    Text("\(dailyMissionPrize)")
                        .postNoBillsJaffnaExtraBold24()
                        .foregroundColor(.white)
                    Image("IconShop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                .frame(height: 24)
            }.padding(.horizontal,20).padding(.vertical,25)
            .frame(width: 341,height: 106)
        }.onAppear(){
            totalCoin += 300
        }
    }
}

struct DailyQuestPrizeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyQuestPrizeView(coinPrize: 100)
    }
}
