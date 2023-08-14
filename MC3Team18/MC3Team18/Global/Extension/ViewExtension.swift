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
    
    func pretendardBold16() -> some View {
        modifier(PretendardTextBold16())
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

// MARK: - Glass Morphic
extension View {
    
    @ViewBuilder
    func GlassMorphicCard( width: CGFloat, height: CGFloat) -> some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterialLight) { view in
                view.gaussianBlurRadius = 4.5
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .frame(width: width, height: height)
        .shadow(
            color: Color(.white).opacity(0.4), radius: 16
        )
    }
    
    func gameOverGlassMorphicButtonLabel(systemName: String, text: String, width: CGFloat, height: CGFloat) -> some View {
        return GlassMorphicCard(width: width, height: height)
            .overlay {
                Image("ButtonGameOverBorder")
                    .resizable()
                    .frame(width: width, height: height)
                    .scaledToFit()
                VStack(spacing: 8){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .frame(height: 25).scaledToFit()
                    Text(text)
                        .foregroundColor(.white)
                }
                .pretendardBold20()
            }
    }
    
    func pauseGlassMorphicButtonLabel(systemName: String, text: String, width: CGFloat, height: CGFloat) -> some View {
        
        return GlassMorphicCard(width: width, height: height)
            .overlay {
                Image("ButtonPauseBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                    Text(text)
                        .foregroundColor(.white)
                        .pretendardBold20()
                    
                }
            }
    }
}
