//
//  MenuView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Image("MenuGradient")
                .resizable()
                .scaledToFit()
                .overlay {
                    VStack {
                        Spacer().frame(maxHeight: 55)
                        HStack {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 10, height: 18)
                                .pretendardBold20()
                                .foregroundColor(.white)
                            
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 18, height: 23)
                                .pretendardBold20()
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 37)
                        .frame(height: 24)
                        Spacer().frame(height: 36)
                        Text("나이스잡! 🎉\n데일리 연습을 완료하셨습니다!")
                            .pretendardRegular24()
                            .lineSpacing(10)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Spacer().frame(height: 60)
                        HStack(spacing: 19) {
                            MenuHexgagonView(isCompleted: true, gameName: "차곡차곡", recordedNumber: 5, unit: "줄")
                            MenuHexgagonView(isCompleted: true, gameName: "풍선껌불기", recordedNumber: 5, unit: "초")
                            MenuHexgagonView(isCompleted: true, gameName: "별 따먹기", recordedNumber: 10, unit: "개")
                        }
                        Spacer()
                    }
                }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        MultiPreview {
            MenuView()
        }
        
        
    }
}
