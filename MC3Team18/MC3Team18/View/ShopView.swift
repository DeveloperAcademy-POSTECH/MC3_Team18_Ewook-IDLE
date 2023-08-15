//
//  ShopView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/30.
//

import SwiftUI

struct ShopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var shopItem: [ShopItem] = []
    @State var selectedItem: ShopItem?
    @State var isPurchasePopupAppear: Bool = false

    var body: some View {
        ZStack{
            Color.CobaltBlue.ignoresSafeArea()
            
            VStack (spacing: 20){
                Image("MainCharacter").resizable().scaledToFit()
                    .frame(width: 211, height: 217, alignment: .bottomTrailing)
                    .overlay {
                        Image(selectedItem?.itemName ?? "")
                    }
                             
                ShopAccessoriesScrollView(shopItem: $shopItem, selectedItem: $selectedItem, isPurchasePopupAppear: $isPurchasePopupAppear)
            }
            .padding(.top, 20)
            
            if isPurchasePopupAppear {
                Color.Black.opacity(0.8).ignoresSafeArea()
                ShopItemPurchaseView()
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
