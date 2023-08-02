//
//  ShopItemData.swift
//  MC3Team18
//
//  Created by jisukwon on 2023/08/02.
//

import UIKit

struct ShopItem : Identifiable, Decodable, Encodable {
    
    let id: UUID = UUID()
    var itemName: String = ""
    var price: Int = 0
    var itemCategory: Int = 0
    var itemStatus: Int = 0
}

extension ShopItem {
    
    static func fetchItemList() -> [ShopItem] {
        print("Json exec")
        var items: [ShopItem] = []
        let jsonDecoder = JSONDecoder()
        
        do {
            if let jsonData = try loadDataFromJSONFile(named: "Item") {
                items = try jsonDecoder.decode([ShopItem].self, from: jsonData)
                print("Json end : \(items)")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return items
    }
    
    static func loadDataFromJSONFile(named fileName: String) throws -> Data? {
        if let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                return data
            } catch {
                throw error
            }
        }
        return nil
    }
}
