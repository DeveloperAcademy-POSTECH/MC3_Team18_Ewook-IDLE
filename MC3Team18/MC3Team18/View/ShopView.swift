//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    
    var body: some View {
        VStack{
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
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
