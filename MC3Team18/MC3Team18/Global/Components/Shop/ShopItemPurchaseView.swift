//
//  ShopItemPurchaseView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/02.
//

import SwiftUI

struct ShopItemPurchaseView: View {
    var body: some View {
        VStack{
            ZStack {
                Image("itemPurchaseBox")
                    .resizable()
                    .frame(width: 323, height: 415)
                
                VStack{
                    VStack(spacing: 16){
                        VStack(spacing: 24) {
                            Image("characterSunglass")
                            VStack (spacing: 8) {
                                Text("나는 멋져 선글라스")
                                    .pretendardBold20()
                                    .foregroundColor(.CobaltBlue)
                                Text("구입하시겠어요?")
                                    .pretendardSemiBold16()
                                    .foregroundColor(.DarkGray)
                            }
                        }
                        
                        ZStack {
                            Image("leftRubyTextBox")
                                .resizable()
                                .frame(width: 184, height: 33)
                            HStack (spacing: 8){
                                Text("현재 보유 루비")
                                    .pretendardSemiBold16()
                                    .foregroundColor(.DarkGray)
                                HStack(spacing: 4){
                                    Image("IconShop")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("1,500")
                                        .font(.custom("PostNoBillsJaffna-ExtraBold", size: 16))
                                        .foregroundColor(.Orange)
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                }
                
            }
            ZStack{
                Image("buttonPurchase")

                Text("1,500")
                    .font(.custom("PostNoBillsJaffna-ExtraBold", size: 32))
                    .foregroundColor(.Orange)
                Image("IconShop")
                    .padding(.trailing, 120)
            }
            
        }
//        .frame(width: 334, height: 496)
        .padding(.horizontal, 34)
    }
}

struct ShopItemPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemPurchaseView()
            .background(.black)
    }
}
