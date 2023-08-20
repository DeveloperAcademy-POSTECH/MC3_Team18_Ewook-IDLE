//
//  ShopItemPurchaseView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/02.
//

import SwiftUI

struct ShopPopupView: View {
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    @Binding var shopItem: [ShopItem]
    @Binding var showPurchasePopup: Bool
    @Binding var tappedItem: ShopItem
    
    let buyAble: Bool
    var body: some View {
        VStack(spacing: 24){
            ZStack {
                Image("itemPurchaseBox")
                    .resizable()
                    .frame(width: 323, height: 415)
                    .overlay(alignment: .topTrailing) {
                        Image("xmarkIcon")
                            .offset(x: 16, y: -14)
                            .onTapGesture {
                                showPurchasePopup = false
                            }
                    }
                VStack{
                    VStack(spacing: 16){
                        VStack(spacing: 24) {
                            ShopPopupCharacterView(tappedItem: tappedItem)
                                .scaleEffect(1.2)
                            VStack (spacing: 8) {
                                Text(tappedItem.itemNameKorean)
                                    .pretendardBold20()
                                    .foregroundColor(.CobaltBlue)
                                Text(buyAble ? "구입하시겠어요?" : "루비가 모자라요!")
                                    .pretendardSemiBold16()
                                    .foregroundColor(buyAble ? .DarkGray : .NegativeRed)
                            }
                        }
                        
                        HStack (spacing: 8){
                            Text("가격")
                                .pretendardSemiBold16()
                                .foregroundColor(.DarkGray)
                            HStack(spacing: 4){
                                Image("IconShop")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text(tappedItem.price.addComma())
                                    .font(.custom("PostNoBillsJaffna-ExtraBold", size: 16))
                                    .foregroundColor(.Orange)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.White
                                    .shadow(.inner(color: .Black.opacity(0.08), radius: 8, x: 0, y: 0)))
                        )
                    }
                    .padding(.top, 10)
                }
            }
            
            switch buyAble {
            case true :
                //TODO: 구매 가능할떄 로직 확인 및 JSOn파일에 저장되는지 확인
                Button {
                    tappedItem.itemStatus = 1
                    totalCoin -= tappedItem.price
                    if let index = shopItem.firstIndex(where: { $0.id == tappedItem.id }) {
                        shopItem[index].itemStatus = tappedItem.itemStatus
                    }
                    ShopItem.saveItemChanges(items: shopItem)
                    showPurchasePopup = false

                    //updatedItem.itemStatus = 1
                    //totalCoin -= updatedItem.price
                    //if let index = shopItem.firstIndex(where: { $0.id == item.id }) {
                    //  shopItem[index].itemStatus = updatedItem.itemStatus
                    //}
                } label: {
                    Text("구매")
                        .shadow(color: .Black.opacity(0.3), radius: 8, x: 2, y: 2)
                        .frame(width: 99, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.Buy
                                    .shadow(.inner(color: Color("BuyGradient"), radius: 8, x: 0, y: -4))
                                    .shadow(.inner(color: .White.opacity(0.35), radius: 8, x: 0, y: 4)))
                        )
                        .pretendardBold20()
                        .foregroundColor(.White)
                }
                
            case false :
                Button {
                } label: {
                    Text("구매")
                        .shadow(color: .Black.opacity(0.3), radius: 8, x: 2, y: 2)
                        .frame(width: 99, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.LightGray
                                    .shadow(.inner(color: .Black.opacity(0.2), radius: 8, x: 0, y: 4)))
                        )
                        .pretendardBold20()
                        .foregroundColor(.DarkGray)
                }.disabled(true)
            }
        }
        //.frame(width: 334, height: 496)
        .padding(.horizontal, 34)
    }
}

//struct ShopItemPurchaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopItemPurchaseView(isPurchasePopupAppear: .constant(true), selectedItem: .constant(Item), buyAble: true)
//            .background(.black)
//    }
//}
