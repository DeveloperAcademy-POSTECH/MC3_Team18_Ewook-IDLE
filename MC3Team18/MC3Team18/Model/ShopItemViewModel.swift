//
//  ShopItemViewModel.swift
//  MC3Team18
//
//  Created by Lee Jinhee on 2023/08/20.
//

import Foundation

@MainActor
class ShopItemViewModel: ObservableObject {
    @Published var shopItemList: [ShopItem] = []
    @Published var selectedAcc: ShopItem?
    @Published var selectedBubble: ShopItem?
    @Published var selectedStar: ShopItem?
    
    var itemJSONURL: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.json")
    }
    
    func fetchSelectedItem() {
        for index in shopItemList.indices {
            if shopItemList[index].itemStatus == 2 && shopItemList[index].itemCategory == .acc {
                selectedAcc = shopItemList[index]
            } else if shopItemList[index].itemStatus == 2 && shopItemList[index].itemCategory == .bubble {
                selectedBubble = shopItemList[index]
            } else if shopItemList[index].itemStatus == 2 && shopItemList[index].itemCategory == .star {
                selectedStar = shopItemList[index]
            }
        }
    }
    
    func fetchItemList() {
        print("Fetching JSON data")
        let jsonDecoder = JSONDecoder()
        
        // Check if the JSON file exists in the document directory
        if let jsonURL = itemJSONURL, FileManager.default.fileExists(atPath: jsonURL.path) {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                shopItemList = try jsonDecoder.decode([ShopItem].self, from: jsonData)
                print("Fetched JSON data from document directory: \(shopItemList)")
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
                        shopItemList = try jsonDecoder.decode([ShopItem].self, from: jsonData)
                        print("Fetched JSON data from copied file: \(shopItemList)")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadDataFromJSONFile(named fileName: String) throws -> Data? {
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
    
    func saveItemChanges() {
        let jsonEncoder = JSONEncoder()
        
        do {
            let data = try jsonEncoder.encode(shopItemList)
            
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
