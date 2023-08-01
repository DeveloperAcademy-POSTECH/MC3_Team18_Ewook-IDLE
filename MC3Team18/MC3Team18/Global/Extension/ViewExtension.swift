//
//  ViewExtension.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

extension View {
    //MARK: Backswipe
    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        action()
                    }
                })
        )
    }
    
    //MARK: Font
    func pretendardBold36() -> some View {
        modifier(PretendardTextBold36())
    }
    
    func pretendardBold24() -> some View {
        modifier(PretendardTextBold24())
    }
    
    func pretendardBold20() -> some View {
        modifier(PretendardTextBold20())
    }
    
    func pretendardBold14() -> some View {
        modifier(PretendardTextBold14())
    }
    
    func pretendardSemiBold32() -> some View {
        modifier(PretendardTextSemiBold32())
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
    
    func pretendardSemiBold16() -> some View {
        modifier(PretendardTextSemiBold16())
    }
    
    func pretendardSemiBold12() -> some View {
        modifier(PretendardTextSemiBold12())
    }
    
    func pretendardLight32() -> some View {
        modifier(PretendardTextLight32())
    }
    
    func pretendardLight16() -> some View {
        modifier(PretendardTextLight16())
    }
    
    func pretendardRegular24() -> some View {
        modifier(PretendardTextRegular24())
    }
    
    func pretendardRegular20() -> some View {
        modifier(PretendardTextRegular20())
    }
    
    func pretendardRegular12() -> some View {
        modifier(PretendardTextRegular12())
    }
    
    func pretendardMedium12() -> some View {
        modifier(PretendardTextMedium12())
    }
    
    func pretendardMedium16() -> some View {
        modifier(PretendardTextMedium16())
    }
    
    func pretendardMedium20() -> some View {
        modifier(PretendardTextMedium20())
    }
    
    func pretendardMedium24() -> some View {
        modifier(PretendardTextMedium24())
    }
    
    func pretendardMedium28() -> some View {
        modifier(PretendardTextMedium28())
    }
    func pretendardExtraLight12() -> some View {
        modifier(PretendardExtraLight12())
    }
    
    func postNoBillsJaffnaRegular64() -> some View {
        modifier(PostNoBillsJaffnaRegular64())
    }
    
    func postNoBillsJaffnaExtraBold20() -> some View {
        modifier(PostNoBillsJaffnaExtraBold20())
    }
    
    func postNoBillsJaffnaExtraBold24() -> some View {
        modifier(PostNoBillsJaffnaExtraBold24())
    }
}
