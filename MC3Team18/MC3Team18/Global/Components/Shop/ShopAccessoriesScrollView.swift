//
//  ShopAccessoriesScrollView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopAccessoriesScrollView: View {
    
    @Binding var shopItem: [ShopItem]
    var itemCategory: Int
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    
    var body: some View {
        VStack(spacing: 16){
            HStack{
                switch itemCategory {
                case 0:
                    Image("AccessoriesTitle")
                case 1:
                    Image("bubbleTitle")
                case 2:
                    Image("starTitle")
                default:
                    Image("AccessoriesTitle")
                }
                
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach($shopItem) { $item in
                        if item.itemCategory == itemCategory {
                            AccessoriesItemBoxView(shopItem: $shopItem, item: $item)
                        }
                    }
                }
            }
        }
        .padding(.leading, 26)
    }
}

struct AccessoriesItemBoxView: View {
    
    @Binding var shopItem: [ShopItem]
    @Binding var item: ShopItem
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    var body: some View {
        VStack(spacing: 8){
            ZStack {
                Image("itemBox")
                    .resizable()
                    .frame(width: 157, height: 162)
                    .shadow(color: Color("Shadow").opacity(0.12), radius: 8, x: 4, y: 4)
                Image("\(item.itemName)")
                switch item.itemStatus {
                case 0:
                    EmptyView()
                case 1:
                    Image("itemLabelSold")
                        .resizable()
                        .frame(width: 157, height: 162)
                case 2:
                    Image("itemLabelInUse")
                        .resizable()
                        .frame(width: 157, height: 162)
                default:
                    EmptyView()
                }
            }
            HStack {
                HStack(spacing: 4){
                    Image("IconShop")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(item.price)")
                        .font(.custom("PostNoBillsJaffna-ExtraBold", size: 24))
                        .foregroundColor(.Yellow)
                }
                Spacer()
                Button {
                    if item.itemStatus == 0 {
                        
                        if item.price <= totalCoin {
                            item.itemStatus = 1
                            totalCoin -= item.price
                            if let index = shopItem.firstIndex(where: { $0.id == item.id }) {
                                shopItem[index].itemStatus = item.itemStatus
                            }
                            ShopItem.saveItemChanges(items: shopItem)
                        } else {
                            print("not enough money")
                        }
                    }
                } label: {
                    switch item.itemStatus {
                    case 0:
                        Image("buttonBuy")
                    case 1:
                        Image("buttonDisabled")
                    case 2:
                        Image("buttonApply")
                    default:
                        EmptyView()
                    }
                }
                .disabled(item.itemStatus == 1)
            }
        }
    }
}
