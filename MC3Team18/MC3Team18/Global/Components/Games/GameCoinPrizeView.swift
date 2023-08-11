//
//  GameCoinPrizeView.swift
//  MC3Team18
//
//  Created by NemoSquare on 7/31/23.
//

import SwiftUI

struct GameCoinPrizeView: View {
    
    @State var coinPrize : Int

    var body: some View {
                
        ZStack {
            RoundedRectangle(cornerRadius: 22,style: .continuous).fill(.ultraThinMaterial).frame(width: 341,height: 74).opacity(0.9)
            VStack{
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
                }.padding(.horizontal,20)
            }.frame(width: 341,height: 74)
        }
    }
}

struct GameCoinPrizeView_Previews: PreviewProvider {
    static var previews: some View {
        GameCoinPrizeView(coinPrize: 1000)
    }
}
