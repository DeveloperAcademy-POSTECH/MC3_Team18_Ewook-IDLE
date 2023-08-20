//
//  ShopItemCharacterView.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/08/20.
//

import SwiftUI

struct ShopPopupCharacterView: View {
    let tappedItem: ShopItem
    
    var body: some View {
        Image("ShopCharacter").resizable().scaledToFit()
            .frame(width: 325, height: 217, alignment: .bottom)
            .overlay {
                switch tappedItem.itemCategory {
                case .acc:
                    Image(tappedItem.itemName)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.2)
                        .offset(x: CGFloat(tappedItem.x ?? 0), y: CGFloat(tappedItem.y ?? 0))
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                case .bubble:
                    Image(tappedItem.itemName)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.35)
                        .offset(y: 15)
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                case .star:
                    Image(tappedItem.itemName)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.26)
                        .offset(x: -80, y: -62)
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                    Image(tappedItem.itemName)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.22)
                        .offset(x: -44, y: -26)
                        .shadow(color: .Black.opacity(0.16), radius: 6, x: 4, y: 4)
                }
            }
    }
}
struct ShopPopupCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        ShopPopupCharacterView(tappedItem: ShopItem(itemName: "starMint", itemNameKorean: "민트", price: 100, itemCategory: .star, itemStatus: 0))
    }
}
