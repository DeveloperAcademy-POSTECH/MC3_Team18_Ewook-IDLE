//
//  ShopAccessoriesScrollView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopAccessoriesScrollView: View {
    @State var selectedCategory: ItemCategory = .acc
    @Binding var shopItem: [ShopItem]
    @Binding var selectedItem: ShopItem?
    @Binding var isPurchasePopupAppear: Bool
    
    var body: some View {
        VStack(spacing: 16){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(ItemCategory.allCases, id: \.rawValue) {category in
                        ShopCategoryTitleView(category: category, selectedCategory: $selectedCategory)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    selectedCategory = category
                                    for index in shopItem.indices {
                                        if shopItem[index].itemStatus == 2 && shopItem[index].itemCategory == selectedCategory {
                                            selectedItem = shopItem[index]
                                            break
                                        } else {
                                            selectedItem = nil
                                        }
                                    }
                                }
                                ShopItem.saveItemChanges(items: shopItem)
                            }
                    }
                }
                .onAppear {
                    for index in shopItem.indices {
                        if shopItem[index].itemStatus == 2 && shopItem[index].itemCategory == .acc {
                            selectedItem = shopItem[index]
                            ShopItem.saveItemChanges(items: shopItem)
                        }
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach($shopItem) { $item in
                        if item.itemCategory.rawValue == selectedCategory.rawValue {
                            AccessoriesItemBoxView(shopItem: $shopItem, item: $item, selectedItem: $selectedItem, isPurchasePopupAppear: $isPurchasePopupAppear)
                        }
                    }
                }
                Spacer().frame(height: 50)
            }
            .shadow(color: .Black.opacity(0.12), radius: 8, x: 4, y: 4)
        }
        .padding(.horizontal, 34)
    }
}


struct ShopCategoryTitleView: View {
    let category: ItemCategory
    @Binding var selectedCategory: ItemCategory
    
    var body: some View {
        Text(category.rawValue)
            .pretendardSemiBold16()
            .foregroundColor(category.rawValue == selectedCategory.rawValue ? .Yellow : .Gray50)
            .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
            .padding(8)
    }
}

//TODO: item, selectedItem 통일
struct AccessoriesItemBoxView: View {

    @Binding var shopItem: [ShopItem]
    @Binding var item: ShopItem
    @AppStorage("totalCoin") var totalCoin: Int = 1000
    @Binding var selectedItem: ShopItem?
    @Binding var isPurchasePopupAppear: Bool
    
    var body: some View {
        VStack(spacing: 8){
            Image("\(item.itemName)")
                .frame(width: 157, height: 162)
                .background(
                    Rectangle()
                        .fill(
                            .white.shadow(.inner(color: .ShadowBlue.opacity(0.25), radius: 4,
                                                 x: item.itemStatus == 0 ? 4 : -4,
                                                 y: item.itemStatus == 0 ? -4 : 4))
                        )
                )
                .overlay(alignment: .topLeading) {
                    switch item.itemStatus {
                    case 0:
                        EmptyView()
                    case 1:
                        Color.Black.opacity(0.4)
                        Image("itemLabelSold")
                            .resizable()
                            .frame(width: 157, height: 162).offset(x: -2, y: -2)
                    case 2:
                        Color.Black.opacity(0.4)
                        Image("itemLabelInUse")
                            .resizable()
                            .frame(width: 157, height: 162).offset(x: -2, y: -2)
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
                            .pretendardBold16()
                            .foregroundColor(.White)
                            .shadow(color: .Black.opacity(0.25), radius: 4, x: 2, y: 2)
                            .frame(width: 66, height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        .linearGradient(colors: [.GradientYellow1, .GradientYellow2], startPoint: .top, endPoint: .bottom)
                                        .shadow(.inner(color: .GradientYellowShadow, radius: 8, x: 0, y: -4))
                                        .shadow(.inner(color: .White.opacity(0.35), radius: 4, x: 0, y: 4))
                                        
                                    )
                            )
                    case 1:
                        Text("장착") // 보유중
                            .pretendardBold16()
                            .foregroundColor(.White)
                            .shadow(color: .Black.opacity(0.25), radius: 4, x: 2, y: 2)
                            .frame(width: 66, height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        .linearGradient(colors: [.GradientRed1, .GradientRed2], startPoint: .top, endPoint: .bottom)
                                        .shadow(.inner(color: .White.opacity(0.20), radius: 8, x: 2, y: 4))
                                    )
                            )
                    case 2:
                        Text("해제") //착용중
                            .pretendardBold16()
                            .foregroundColor(.InUseFont)
                            .frame(width: 66, height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        Color.InUse
                                        .shadow(.inner(color: Color.InUseShadow.opacity(0.80), radius: 4, x: 2, y: 4))
                                    )
                            )
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
    
    func updateItem( _ updatedItem: inout ShopItem) {
        switch updatedItem.itemStatus {
        case 0:
            if updatedItem.price <= totalCoin {
                //TODO: 팝업뷰 로직 & UI 변경, 아래 item.id
                isPurchasePopupAppear = true
                updatedItem.itemStatus = 1
                totalCoin -= updatedItem.price
                if let index = shopItem.firstIndex(where: { $0.id == item.id }) {
                    shopItem[index].itemStatus = updatedItem.itemStatus
                }
            } else {
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
