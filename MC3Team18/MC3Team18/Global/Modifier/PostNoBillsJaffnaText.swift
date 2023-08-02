//
//  PostNoBillsJaffnaText.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct PostNoBillsJaffnaRegular64: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.custom("PostNoBillsJaffna-Medium", size: 64))
    }
}

struct PostNoBillsJaffnaExtraBold20: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.custom("PostNoBillsJaffna-ExtraBold", size: 20))
    }
}

struct PostNoBillsJaffnaExtraBold24: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.custom("PostNoBillsJaffna-ExtraBold", size: 24))
    }
}
