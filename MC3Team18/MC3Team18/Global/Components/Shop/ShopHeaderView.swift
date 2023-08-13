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
        HStack(spacing: -10) {
            Image("IconShop")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28).zIndex(1)
            
            Text(totalCoin.addComma())
                .postNoBillsJaffnaExtraBold20()
                .foregroundColor(.Yellow)
                .padding(.leading, 14)
                .padding(.trailing, 12)
                .background(
                    RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.2))
                )
        }
    }
}

struct ShopHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShopHeaderView()
            .background(.blue)
    }
}
