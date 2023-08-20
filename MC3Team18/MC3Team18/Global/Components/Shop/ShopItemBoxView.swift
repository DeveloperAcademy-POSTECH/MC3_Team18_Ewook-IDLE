//
//  ShopItemBoxView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/08/20.
//

import SwiftUI

struct ShopItemBoxView: View {
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    @Binding var shopItem: [ShopItem]
    @Binding var item: ShopItem
    @Binding var selectedItem: ShopItem?
    @Binding var tappedItem: ShopItem
    @Binding var isPurchasePopupAppear: Bool
    @Binding var buyable: Bool
    var body: some View {
        VStack(spacing: 8){
            Image("\(item.itemName)")
                .frame(width: 157, height: 162)
                .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                .background(
                    Rectangle()
                        .fill(
                            .white.shadow(.inner(color: .ShadowBlue.opacity(0.25), radius: 4, x: 4, y: -4))
                        )
                )
                .overlay(alignment: .topLeading) {
                    switch item.itemStatus {
                    case 1:
                        Image("itemLabelSold")
                            .resizable()
                            .frame(width: 157, height: 162).offset(x: -6, y: -6)
                    case 2:
                        Image("itemLabelInUse")
                            .resizable()
                            .frame(width: 157, height: 162).offset(x: -6, y: -6)
                    default:
                        EmptyView()
                    }
                }
                .cornerRadius(12)
            
            HStack {
                HStack(spacing: 4){
                    Image("IconShop")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                    Text("\(item.price)")
                        .postNoBillsJaffnaExtraBold24()
                        .foregroundColor(.Yellow)
                }
                Spacer()
                Button {
                    updateItem(&item)
                } label: {
                    switch item.itemStatus {
                    case 0:
                        Text("구매")
                            .shadow(color: .Black.opacity(0.3), radius: 8, x: 2, y: 2)
                            .frame(width: 60, height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.Buy.shadow(.inner(color: .White.opacity(0.35), radius: 4, x: 0, y: 4)))
                            )
                    case 1:
                        Text("착용")
                            .shadow(color: .Black.opacity(0.3), radius: 8, x: 2, y: 2)
                            .frame(width: 60, height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.Use.shadow(.inner(color: .White.opacity(0.35), radius: 4, x: 0, y: 4)))
                            )
                    case 2:
                        Text("해제")
                            .shadow(color: .Black.opacity(0.3), radius: 8, x: 2, y: 2)
                            .frame(width: 60, height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.Unuse.shadow(.inner(color: .White.opacity(0.35), radius: 4, x: 0, y: 4)))
                            )
                    default:
                        EmptyView()
                    }
                }
                .pretendardBold16()
                .foregroundColor(.White)
            }
        }
    }
    
    func updateItem( _ updatedItem: inout ShopItem) {
        switch updatedItem.itemStatus {
        case 0:
            if updatedItem.price <= totalCoin {
                tappedItem = updatedItem
                buyable = true
                isPurchasePopupAppear = true
                
//                updatedItem.itemStatus = 1
//                totalCoin -= updatedItem.price
//                if let index = shopItem.firstIndex(where: { $0.id == item.id }) {
//                    shopItem[index].itemStatus = updatedItem.itemStatus
//                }
            } else {
                tappedItem = updatedItem
                buyable = false
                isPurchasePopupAppear = true
                print("not enough money")
            }
        case 1:
            print("보유 > 장착")
            for index in shopItem.indices {
                //TODO: 조건문 확인
                if shopItem[index].itemStatus == 2 && shopItem[index].itemCategory == updatedItem.itemCategory {
                    shopItem[index].itemStatus = 1
                }
            }
            selectedItem = updatedItem
            updatedItem.itemStatus = 2
        case 2:
            print("장착 > 보유")
            if var selected = selectedItem {
                selected.itemStatus = 1
            }
            selectedItem = nil
            updatedItem.itemStatus = 1
        default:
            print("default")
        }
        
        if let index = shopItem.firstIndex(where: { $0.id == updatedItem.id }) {
            shopItem[index].itemStatus = updatedItem.itemStatus
        }
        ShopItem.saveItemChanges(items: shopItem)
    }
}


//struct ShopItemBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopItemBoxView()
//    }
//}
