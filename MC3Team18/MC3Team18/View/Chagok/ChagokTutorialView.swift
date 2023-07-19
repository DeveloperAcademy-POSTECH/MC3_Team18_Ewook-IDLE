//
//  ChagokTutorialView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokTutorialView: View {
    
    @Binding var chagokStatus: ChagokStatus
    @EnvironmentObject var chagokScene: ChagokSKScene

    var body: some View {
        ZStack {
            
            Color.black.opacity(0.75)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        chagokScene.isNotUpdate = false
                        withAnimation(.easeOut(duration: 0.3)) {
                            chagokStatus = .game
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                    }
                }
                .padding(.top, 48)
                .padding(.trailing, 26)
                Text("차곡차곡")
                    .pretendardSemiBold32()
                    .foregroundColor(.Yellow)
                    
                    .padding(.top, 94)
                    .padding(.bottom, 45)
                Text("컵에 있는 입모양대로\n내 입을 움직여서\n아래에서 부터 차곡차곡 쌓아보세요!")
                    .pretendardSemiBold20()
                    .lineSpacing(7)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    Button(action: {
                        UserDefaults.standard.set(true, forKey: "isTutorialDisabled")
                        chagokScene.isNotUpdate = false
                        withAnimation(.easeOut(duration: 0.3)) {
                            chagokStatus = .game
                        }
                    }, label: {
                        Image(systemName: "checkmark.square")
                            .resizable()
                            .pretendardSemiBold20()
                            .frame(width: 29, height: 29)
                        Text("다시 보지 않기")
                            .pretendardRegular20()
                    })
                }
                .padding(.bottom, 36)
                
                
            }
            .foregroundColor(.white)
            .ignoresSafeArea()
            
//            LottieView(filename: "lottieAnima_chagok")
//                .scaledToFit()
//                .frame(width: 200)
            
            
        }
        .statusBarHidden()
        .onAppear {
            chagokScene.isNotUpdate = true
        }
    }
}

struct ChagokTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokTutorialView(chagokStatus: .constant(.tutorial))
    }
}
