//
//  ShopAccessoriesScrollView.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/01.
//

import SwiftUI

struct ShopItemScrollView: View {
    @EnvironmentObject var shopItemVM: ShopItemViewModel
    @Binding var selectedCategory: ItemCategory
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
                                        switch selectedCategory {
                                        case .acc:
                                            shopItemVM.selectedAcc = shopItemVM.shopItemList[index]
                                        case .bubble:
                                            shopItemVM.selectedBubble = shopItemVM.shopItemList[index]
                                        case .star:
                                            shopItemVM.selectedStar = shopItemVM.shopItemList[index]
                                        }
                                        break
                                    } else {
                                        switch selectedCategory {
                                        case .acc:
                                            shopItemVM.selectedAcc = nil
                                        case .bubble:
                                            shopItemVM.selectedBubble = nil
                                        case .star:
                                            shopItemVM.selectedStar = nil
                                        }
                                    }
                                }
                                shopItemVM.saveItemChanges()
                            }
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach($shopItemVM.shopItemList) { $item in
                        if item.itemCategory.rawValue == selectedCategory.rawValue {
                            ShopItemBoxView(item: $item, tappedItem: $tappedItem, isPurchasePopupAppear: $isPurchasePopupAppear, buyable: $buyable)
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
