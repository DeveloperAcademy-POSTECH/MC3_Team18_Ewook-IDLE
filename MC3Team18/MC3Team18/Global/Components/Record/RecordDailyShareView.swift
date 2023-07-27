//
//  DailyShareView.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct RecordDailyShareView: View {
    
    @AppStorage("chagokMissionSuccess") var chagokMissionSuccess: Bool = false
    @AppStorage("BubbleMissionSuccess") var bubbleMissionSuccess: Bool = false
    @AppStorage("BanjjakMissionSuccess") var banjjakMissionSuccess: Bool = false
    var completedNum: Int {
        [chagokMissionSuccess, bubbleMissionSuccess, banjjakMissionSuccess].filter( { (value: Bool) -> Bool in return (value) } ).count
    }
    
    
    var body: some View {
        ZStack {
            Image("BackgroundDailyShare")
                .resizable()
                .frame(width: 393, height: 393)
            VStack {
                Spacer().frame(height: 99)
                
                switch completedNum {
                case 0:
                    Text("오늘의 SounDrill, 함께 시작해요👋🏻")
                        .pretendardRegular24()
                        .foregroundColor(.white)
                case 1...2:
                    Text("오늘의 SounDrill 하는 중 💬")
                        .pretendardRegular24()
                        .foregroundColor(.white)
                case 3:
                    Text("오늘의 SounDrill 완료! 🎉")
                        .pretendardRegular24()
                        .foregroundColor(.white)
                default:
                    Text("오늘의 SounDrill, 함께 시작해요👋🏻")
                        .pretendardRegular24()
                        .foregroundColor(.white)
                }
                Spacer().frame(height: 33)
                HStack(spacing: 19) {
                    RecordHexgagonView(isCompleted: bubbleMissionSuccess, gameName: "버블버블", recordedNumber: 5, unit: "줄")
                    RecordHexgagonView(isCompleted: chagokMissionSuccess, gameName: "차곡차곡", recordedNumber: 5, unit: "초")
                    RecordHexgagonView(isCompleted: banjjakMissionSuccess, gameName: "반짝반짝", recordedNumber: 10, unit: "개")
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
        RecordDailyShareView()
    }
}
