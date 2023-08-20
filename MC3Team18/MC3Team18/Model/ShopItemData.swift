//
//  ShopItemData.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/02.
//

import UIKit

struct ShopItem : Identifiable, Codable {
    let id: UUID = UUID()
    var itemName: String
    var itemNameKorean: String
    var price: Int
    var itemCategory: ItemCategory
    var itemStatus: Int
    var x: Int?
    var y: Int?
}
