//
//  SwiftUIView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopHeaderView: View {
    
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    
    var body: some View {
        VStack (spacing: 16){
            HStack {
                Spacer()
                HStack(spacing: -10) {
                    Image("IconShop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    ZStack{
                        Rectangle()
                            .cornerRadius(12)
                            .frame(width: 68, height: 28)
                            .opacity(0.2)
                        Text(totalCoin.addComma())
                            .postNoBillsJaffnaExtraBold20()
                            .foregroundColor(.Yellow)
                    }
                }
            }
            Text("Shop")
                .pretendardRegular24()
                .foregroundColor(.white)
        }
        .frame(height: 78)
        .padding(.horizontal, 26)
    }
}

struct ShopHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShopHeaderView()
            .background(.blue)
    }
}
