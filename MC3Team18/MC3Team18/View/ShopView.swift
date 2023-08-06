//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    
    @State var shopItem: [ShopItem] = []
    
    var body: some View {
        ZStack{
            Image("BackgroundShopView")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack (spacing: 24){
                ShopHeaderView()
                    .padding(.top, 60)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (spacing: 40){
                        ShopAccessoriesScrollView(shopItem: $shopItem, itemCategory: 0)
                        ShopAccessoriesScrollView(shopItem: $shopItem, itemCategory: 1)
                        ShopAccessoriesScrollView(shopItem: $shopItem, itemCategory: 2)
                        Spacer().frame(height: 50)
                    }
                }
            }
        }
        .onAppear {
            shopItem = ShopItem.fetchItemList() 
        }

    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
