//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    @AppStorage("dummyItem") var dummyItem: Int = 0
    
    var body: some View {
        VStack{
            Spacer()
            Text("Shop View")
            Text("Coin Balance: " + String(totalCoin))
            Button(action: {
                totalCoin = totalCoin + 100
            },
                   label: {
                Text("Debug : Coin balance++")
            })
            Button(action: {
                totalCoin = totalCoin - 100
            },
                   label: {
                Text("Debug : Coin balance--")
            })
            Spacer()
            Text("더미 아이템 갯수 :" + String(dummyItem))
            Button(action: {
                if totalCoin >= 100 {
                    totalCoin = totalCoin - 100
                    dummyItem += 1
                }
            },
                   label: {
                Text("더미 아이템 구입, 가격 : 100코인")
            })
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
