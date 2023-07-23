//
//  DailyShareView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct DailyShareView: View {
    var body: some View {
        ZStack {
            Image("BackgroundDailyShare")
                .resizable()
                .frame(width: 393, height: 393)
            VStack {
                Spacer().frame(height: 99)
                Text("오늘의 SpeechDrill 완료! 🎉")
                    .pretendardRegular24()
                    .foregroundColor(.white)
                Spacer().frame(height: 33)
                HStack(spacing: 19) {
                    MenuHexgagonView(isCompleted: true, gameName: "차곡차곡", recordedNumber: 5, unit: "줄")
                    MenuHexgagonView(isCompleted: true, gameName: "풍선껌불기", recordedNumber: 5, unit: "초")
                    MenuHexgagonView(isCompleted: true, gameName: "별 따먹기", recordedNumber: 10, unit: "개")
                }
                Spacer().frame(height: 121)
            }
            .frame(width: 393, height: 393)
        }
        .frame(width: 393, height: 393)
    }
}

struct DailyShareView_Previews: PreviewProvider {
    static var previews: some View {
        DailyShareView()
    }
}
