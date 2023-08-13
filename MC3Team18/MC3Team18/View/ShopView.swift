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
            Color.CobaltBlue
                .ignoresSafeArea()
            VStack (spacing: 24){
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
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("상점")
                    .pretendardSemiBold24()
                    .foregroundColor(.white)
                    .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ShopHeaderView().padding(.trailing, 18)
            }
        }
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
