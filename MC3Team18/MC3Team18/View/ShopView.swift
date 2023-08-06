//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    
    @State var shopItem: [ShopItem] = []
    @State var shopAccessoryItem: [ShopItem] = []
    @State var shopBubbleGumItem: [ShopItem] = []
    @State var shopStarItem: [ShopItem] = []
    
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
                        ShopAccessoriesScrollView(shopItem: $shopAccessoryItem)
                        ShopAccessoriesScrollView(shopItem: $shopBubbleGumItem)
                        ShopAccessoriesScrollView(shopItem: $shopStarItem)
                        Spacer().frame(height: 50)
                    }
                }
            }
                        

        }
        .onAppear {
            shopItem = ShopItem.fetchItemList()
            shopAccessoryItem = shopItem.filter { $0.itemCategory == 0 }
            shopBubbleGumItem = shopItem.filter { $0.itemCategory == 1 }
            shopStarItem = shopItem.filter { $0.itemCategory == 2 }
    
            
        }

    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
