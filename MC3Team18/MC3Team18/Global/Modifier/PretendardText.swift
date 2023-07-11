//
//  PretendardTextModifier.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct PretendardTextBold36: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.custom("Pretendard-Bold", size: 36))
    }
}


