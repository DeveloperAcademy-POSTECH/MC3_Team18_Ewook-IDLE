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
    var price: Int
    var itemCategory: ItemCategory
    var itemStatus: Int
    var x: Int?
    var y: Int?
}

extension ShopItem {
    
    static var itemJSONURL: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.json")
    }
    
    static func fetchItemList() -> [ShopItem] {
        print("Fetching JSON data")
        var items: [ShopItem] = []
        let jsonDecoder = JSONDecoder()
        
        // Check if the JSON file exists in the document directory
        if let jsonURL = itemJSONURL, FileManager.default.fileExists(atPath: jsonURL.path) {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                items = try jsonDecoder.decode([ShopItem].self, from: jsonData)
                print("Fetched JSON data from document directory: \(items)")
            } catch {
                print(error.localizedDescription)
            }
        } else {
            // If the JSON file does not exist, copy it from the app bundle
            if let bundleJSONURL = Bundle.main.url(forResource: "Item", withExtension: "json") {
                do {
                    try FileManager.default.copyItem(at: bundleJSONURL, to: itemJSONURL!)
                    print("Copied JSON file from app bundle to document directory")
                    
                    // Now load the data from the copied file
                    if let jsonData = try loadDataFromJSONFile(named: "Item") {
                        items = try jsonDecoder.decode([ShopItem].self, from: jsonData)
                        print("Fetched JSON data from copied file: \(items)")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        return items
    }
    
    static func loadDataFromJSONFile(named fileName: String) throws -> Data? {
        if let fileUrl = itemJSONURL {
            do {
                let data = try Data(contentsOf: fileUrl)
                return data
            } catch {
                throw error
            }
        }
        return nil
    }
    
    static func saveItemChanges(items: [ShopItem]) {
        let jsonEncoder = JSONEncoder()
        
        do {
            let data = try jsonEncoder.encode(items)
            
            if let jsonURL = itemJSONURL {
                try data.write(to: jsonURL)
                print("Data saved to \(jsonURL)")
            } else {
                print("Could not get JSON file URL")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
