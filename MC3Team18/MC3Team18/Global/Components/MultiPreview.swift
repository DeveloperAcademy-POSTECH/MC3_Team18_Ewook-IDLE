//
//  MultiPreview.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/12.
//

import SwiftUI

struct MultiPreview<Content>: View where Content: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        
        content()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
        content()
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("iPhone 14 Pro Max")
        content()
            .previewDevice("iPhone 13 mini")
            .previewDisplayName("iPhone 13 mini")
    }
}

