//
//  ShopAccessoriesScrollView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopItemScrollView: View {
    @State var selectedCategory: ItemCategory = .acc
    @Binding var shopItem: [ShopItem]
    @Binding var selectedItem: ShopItem?
    @Binding var tappedItem: ShopItem
    @Binding var isPurchasePopupAppear: Bool
    @Binding var buyable: Bool
    var body: some View {
        VStack(spacing: 16){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(ItemCategory.allCases, id: \.rawValue) {category in
                        ShopCategoryTitleView(category: category, selectedCategory: $selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                                for index in shopItem.indices {
                                    if shopItem[index].itemStatus == 2 && shopItem[index].itemCategory == selectedCategory {
                                        selectedItem = shopItem[index]
                                        break
                                    } else {
                                        selectedItem = nil
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
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach($shopItem) { $item in
                        if item.itemCategory.rawValue == selectedCategory.rawValue {
                            ShopItemBoxView(shopItem: $shopItem, item: $item, selectedItem: $selectedItem, tappedItem: $tappedItem, isPurchasePopupAppear: $isPurchasePopupAppear, buyable: $buyable)
                        }
                    }
                }
                Spacer().frame(height: 50)
            }
            .shadow(color: .Black.opacity(0.12), radius: 8, x: 4, y: 4)
        }
        .padding(.horizontal, 32)
    }
}


struct ShopCategoryTitleView: View {
    let category: ItemCategory
    @Binding var selectedCategory: ItemCategory
    
    var body: some View {
        Text(category.rawValue)
            .pretendardBold16()
            .foregroundColor(category.rawValue == selectedCategory.rawValue ? .Yellow : .Gray50)
            .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
            .padding(8)
    }
}
