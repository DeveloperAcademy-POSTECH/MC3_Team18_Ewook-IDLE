//
//  MC3Team18App.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/10.
//

import SwiftUI

@main
struct MC3Team18App: App {
    @StateObject var shopItemVM = ShopItemViewModel()
    
    init() {
        Font.registerFonts(fontName: "Pretendard-Bold")
        Font.registerFonts(fontName: "Pretendard-Light")
        Font.registerFonts(fontName: "Pretendard-Regular")
        Font.registerFonts(fontName: "Pretendard-SemiBold")
        Font.registerFonts(fontName: "Pretendard-Medium")
        Font.registerFontsTTF(fontName: "PostNoBillsJaffna-Medium")
        Font.registerFontsTTF(fontName: "PostNoBillsJaffna-ExtraBold")
        
        
    }
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(shopItemVM)
        }
    }
}
