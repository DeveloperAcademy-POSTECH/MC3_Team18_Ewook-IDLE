//
//  ViewExtension.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

extension View {
    
    func pretendardBold36() -> some View {
        modifier(PretendardTextBold36())
    }
    
    func pretendardBold20() -> some View {
        modifier(PretendardTextBold20())
    }
    
    func pretendardSemiBold28() -> some View {
        modifier(PretendardTextSemiBold28())
    }
    
    func pretendardSemiBold24() -> some View {
        modifier(PretendardTextSemiBold24())
    }
    
    func pretendardSemiBold20() -> some View {
        modifier(PretendardTextSemiBold20())
    }
    
    func pretendardSemiLight32() -> some View {
        modifier(PretendardTextLight32())
    }
    
    func pretendardRegular20() -> some View {
        modifier(PretendardTextRegular20())
    }
    
    func postNoBillsJaffnaRegular64() -> some View {
        modifier(PostNoBillsJaffnaRegular64())
    }
}
