//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    
    @State var shopItem: [ShopItem] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
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
        .onBackSwipe {
            presentationMode.wrappedValue.dismiss()
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: btnBack)

    }
    
    var btnBack : some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backIcon
                .scaledToFit()
                .frame(width: 16, height: 16)
                .pretendardSemiBold20()
                .foregroundColor(.white).padding()
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
