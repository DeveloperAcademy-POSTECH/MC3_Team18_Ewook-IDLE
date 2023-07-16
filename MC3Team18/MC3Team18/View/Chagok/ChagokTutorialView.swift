//
//  ChagokTutorialView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/11.
//

import SwiftUI

struct ChagokTutorialView: View {
    
    @Binding var chagokStatus: ChagokStatus
    @StateObject var chagokScene = ChagokSKScene(size: CGSize(width: 150, height: 300))

    var body: some View {
        ZStack {
            
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        chagokStatus = .game
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .pretendardSemiBold20()
                            .frame(width: 36, height: 36)
                    }
                }
                .padding(.top, 26)
                .padding(.trailing, 27)
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
                        chagokStatus = .game
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
            
        }
        .statusBarHidden()
        .onAppear {
            chagokScene.isPaused = true
        }
    }
}

struct ChagokTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        ChagokTutorialView(chagokStatus: .constant(.tutorial))
    }
}
