//
//  ShopAccessoriesScrollView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopItemScrollView: View {
    @EnvironmentObject var shopItemVM: ShopItemViewModel
    @State var selectedCategory: ItemCategory = .acc
    @Binding var selectedItem: ShopItem?
    @Binding var tappedItem: ShopItem
    @Binding var isPurchasePopupAppear: Bool
    @Binding var buyable: Bool

    var body: some View {
        VStack(spacing: 16){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(ItemCategory.allCases, id: \.rawValue) {category in
                        ShopCategoryTitleView(category: category, selectedCategory: selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                                for index in shopItemVM.shopItemList.indices {
                                    if shopItemVM.shopItemList[index].itemStatus == 2 && shopItemVM.shopItemList[index].itemCategory == selectedCategory {
                                        selectedItem = shopItemVM.shopItemList[index]
                                        break
                                    } else {
                                        selectedItem = nil
                                    }
                                }
                                shopItemVM.saveItemChanges()
                            }
                    }
                }
                .onAppear {
                    for index in shopItemVM.shopItemList.indices {
                        if shopItemVM.shopItemList[index].itemStatus == 2 && shopItemVM.shopItemList[index].itemCategory == .acc {
                            selectedItem = shopItemVM.shopItemList[index]
                            shopItemVM.saveItemChanges()
                        }
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach($shopItemVM.shopItemList) { $item in
                        if item.itemCategory.rawValue == selectedCategory.rawValue {
                            ShopItemBoxView(item: $item, selectedItem: $selectedItem, tappedItem: $tappedItem, isPurchasePopupAppear: $isPurchasePopupAppear, buyable: $buyable)
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
    let selectedCategory: ItemCategory
    
    var body: some View {
        Text(category.rawValue)
            .pretendardBold16()
            .foregroundColor(category.rawValue == selectedCategory.rawValue ? .Yellow : .Gray50)
            .shadow(color: Color("Shadow").opacity(0.5), radius: 8, x: 0, y: 0)
            .padding(8)
    }
}
